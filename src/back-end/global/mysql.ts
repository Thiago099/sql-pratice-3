import {createConnection} from 'mysql'

export const connection = createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'meaning'
});
 
connection.connect();
 