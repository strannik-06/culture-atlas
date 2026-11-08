/* Public metadata only. Personal drafts and progress stay in the app state. */
(()=>{'use strict';const pending=new Map(),loaded=new Set();
const fileFor=id=>window.CULTURE_FILM_DETAIL_FILES?.[Math.floor(Number(id)/100)];
function has(id){return !!window.CULTURE_FILM_DETAILS?.[id]&&!!fileFor(id);}
async function ensure(id){const file=fileFor(id);if(!file||loaded.has(file))return window.CULTURE_FILM_DETAILS?.[id];
 if(!/^[0-9]+-[a-f0-9]{16}\.json$/.test(file))throw Error('Invalid film detail asset.');
 if(!pending.has(file)){const task=(async()=>{const response=await fetch('assets/film-details/'+file);if(!response.ok)throw Error('Film details could not load.');const data=await response.json();if(data?.version!==1||!data.films||typeof data.films!=='object'||!data.films[id])throw Error('Invalid film detail response.');for(const[key,value]of Object.entries(data.films)){if(fileFor(key)!==file||!value||typeof value!=='object'||Array.isArray(value))throw Error('Invalid film detail record.');}for(const[key,value]of Object.entries(data.films))window.CULTURE_FILM_DETAILS[key]={...window.CULTURE_FILM_DETAILS[key],...value};loaded.add(file);})();pending.set(file,task);task.catch(()=>{}).finally(()=>pending.delete(file));}
 await pending.get(file);return window.CULTURE_FILM_DETAILS?.[id];}
window.CultureFilmDetails={ensure,has,isLoaded:id=>loaded.has(fileFor(id))};})();
