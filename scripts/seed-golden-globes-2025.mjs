#!/usr/bin/env node
// Official Golden Globes 2025 film nominations (12 major categories).
// Sources: https://goldenglobes.com/articles/nominations-announced-for-82nd-annual-golden-globes/
//          https://goldenglobes.com/articles/the-82nd-golden-globe-awards-winners/
import fs from 'node:fs';
const read=(file,key)=>{const s=fs.readFileSync(file,'utf8');const m='window.'+key+' = ';return JSON.parse(s.slice(s.indexOf(m)+m.length).trim().replace(/;$/,''))};
const write=(file,key,data)=>fs.writeFileSync(file,'window.'+key+' = '+JSON.stringify(data,null,2)+';\n');
const catalog=read('film-catalog.js','CULTURE_CATALOG');
const events=read('awards-2025.js','CULTURE_AWARDS');
if(events.some(e=>e.event==='Golden Globes'&&e.year===2025))throw Error('Golden Globes 2025 already exists');
const additions=[
 ['Maria','Pablo Larraín'],['Babygirl','Halina Reijn'],['Nightbitch','Marielle Heller'],
 ['Saturday Night','Jason Reitman'],['Kinds of Kindness','Yorgos Lanthimos'],
 ['Hit Man','Richard Linklater'],['Moana 2','David Derrick Jr., Jason Hand, Dana Ledoux Miller']
];
let next=Math.max(...catalog.map(f=>f.id))+1;
for(const [title,director] of additions){
 if(catalog.some(f=>f.title.toLowerCase()===title.toLowerCase()))throw Error('Existing catalogue title needs review: '+title);
 catalog.push({id:next++,title,director,year:2024});
}
const id=title=>{const hits=catalog.filter(f=>f.title.toLowerCase()===title.toLowerCase());if(hits.length!==1)throw Error('Missing/ambiguous film '+title);return hits[0].id};
const categories=[
 ['Best Motion Picture – Drama',['The Brutalist','A Complete Unknown','Conclave','Dune: Part Two','Nickel Boys','September 5'],'The Brutalist'],
 ['Best Motion Picture – Musical or Comedy',['Anora','Challengers','Emilia Pérez','A Real Pain','The Substance','Wicked'],'Emilia Pérez'],
 ['Best Motion Picture – Animated',['Flow','Inside Out 2','Memoir of a Snail','Moana 2','Wallace & Gromit: Vengeance Most Fowl','The Wild Robot'],'Flow'],
 ['Best Motion Picture – Non-English Language',['All We Imagine as Light','Emilia Pérez','The Girl with the Needle',"I'm Still Here",'The Seed of the Sacred Fig','Vermiglio'],'Emilia Pérez'],
 ['Leading Actress – Drama',['The Last Showgirl','Maria','Babygirl','The Room Next Door',"I'm Still Here",'Lee'],"I'm Still Here"],
 ['Leading Actor – Drama',['The Brutalist','A Complete Unknown','Queer','Sing Sing','Conclave','The Apprentice'],'The Brutalist'],
 ['Leading Actress – Musical or Comedy',['Nightbitch','Wicked','Emilia Pérez','Anora','The Substance','Challengers'],'The Substance'],
 ['Leading Actor – Musical or Comedy',['A Real Pain','Heretic','Saturday Night','Kinds of Kindness','Hit Man','A Different Man'],'A Different Man'],
 ['Supporting Actress',['Emilia Pérez','Wicked','The Brutalist','The Substance','Conclave'],'Emilia Pérez'],
 ['Supporting Actor',['Anora','A Real Pain','A Complete Unknown','The Brutalist','The Apprentice','Gladiator II'],'A Real Pain'],
 ['Director',['Emilia Pérez','Anora','Conclave','The Brutalist','The Substance','All We Imagine as Light'],'The Brutalist'],
 ['Screenplay',['Emilia Pérez','Anora','The Brutalist','A Real Pain','The Substance','Conclave'],'Conclave']
];
// Film-centric UI lists each nominated film once per category, even if multiple actors
// from the same film were nominated (e.g. Emilia Pérez supporting actresses).
const cat=categories.map(([name,titles,winner])=>({name,nominees:titles.map(id),winner:id(winner)}));
const filmIds=[...new Set(cat.flatMap(c=>c.nominees))];
const filmRefs=filmIds.map(filmId=>{const f=catalog.find(x=>x.id===filmId);return {id:f.id,title:f.title,director:f.director,year:f.year,awards:cat.filter(c=>c.winner===filmId).map(c=>c.name)}});
events.push({event:'Golden Globes',year:2025,section:'Major Film Categories',dates:'5 January 2025',awardsDate:'5 January 2025',source:'https://goldenglobes.com/articles/nominations-announced-for-82nd-annual-golden-globes/',awardsSource:'https://goldenglobes.com/articles/the-82nd-golden-globe-awards-winners/',resultsUrl:'https://goldenglobes.com/articles/the-82nd-golden-globe-awards-winners/',films:filmRefs,categories:cat});
write('film-catalog.js','CULTURE_CATALOG',catalog);write('awards-2025.js','CULTURE_AWARDS',events);
console.log('Golden Globes 2025: '+cat.length+' categories, '+filmRefs.length+' unique films, '+additions.length+' new catalogue identities');
