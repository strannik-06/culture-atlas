#!/usr/bin/env node
// Seed missing official Berlinale 2025 Competition films with stable IDs.
// TMDB identity matching is a separate mandatory step; no guessed TMDB IDs.
import fs from 'node:fs';
const read=(name,key)=>{const s=fs.readFileSync(name,'utf8');const marker='window.'+key+' = ';return JSON.parse(s.slice(s.indexOf(marker)+marker.length).trim().replace(/;$/,''))};
const write=(name,key,items)=>fs.writeFileSync(name,'window.'+key+' = '+JSON.stringify(items,null,2)+';\n');
const catalog=read('film-catalog.js','CULTURE_CATALOG');
const events=read('awards-2025.js','CULTURE_AWARDS');
const berlinale=events.find(e=>e.event==='Berlinale'&&e.year===2025);
if(!berlinale)throw Error('Missing Berlinale 2025');
const missing=[
 ['Ari','Léonor Serraille',['Arï']],
 ['The Safe House','Lionel Baier',['La cache']],
 ['Dreams','Michel Franco'],
 ['What Does that Nature Say to You','Hong Sang-soo',['Geu jayeoni nege mworago hani']],
 ['Hot Milk','Rebecca Lenkiewicz'],
 ["Mother's Baby",'Johanna Moder'],
 ['Reflection in a Dead Diamond','Hélène Cattet, Bruno Forzani',['Reflet dans un diamant mort']],
 ['Girls on Wire','Vivian Qu',['Xiang fei de nv hai']],
 ['Timestamp','Kateryna Gornostai',['Strichka chasu']],
 ['What Marielle Knows','Frédéric Hambalek',['Was Marielle weiß']],
 ['Yunan','Ameer Fakher Eldin']
];
if(berlinale.films.length!==8)throw Error('Unexpected Berlinale baseline: '+berlinale.films.length);
let next=Math.max(...catalog.map(f=>f.id))+1;
for(const [title,director,alternate_titles] of missing){
 if(catalog.some(f=>f.title===title&&f.director===director))throw Error('Already in catalogue: '+title);
 const film={id:next++,title,director,year:2025,...(alternate_titles?{alternate_titles}:{})};
 catalog.push(film);
 berlinale.films.push({id:film.id,title,director,year:2025,awards:[]});
}
if(berlinale.films.length!==19)throw Error('Expected 19 films');
berlinale.section='Main Competition';delete berlinale.scope;
berlinale.source='https://www.berlinale.de/en/2025/topics/competition-2025-2.html';
write('film-catalog.js','CULTURE_CATALOG',catalog);
write('awards-2025.js','CULTURE_AWARDS',events);
console.log('Seeded 11 competition films; TMDB matching required before committing');
