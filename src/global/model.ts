import { connection } from '@/global/mysql';
import base_entity from '@/global/base_entity';
export class model<T extends base_entity>
{
    constructor(table_name: string)
    {
        this.table_name = table_name;
    }

    table_name: string;

    async get() {
        return await new Promise<T[]>((resolve,reject)=>{
            connection.query(`SELECT * FROM ${this.table_name}`, function (error, results) {
                if (error) reject(error);
                resolve(results)
            });
        })
    }
    async save(data: T[]) {
        for(const row of data)
        {
            if(row.delete)
            {
                connection.query(`DELETE FROM ${this.table_name} WHERE id = ?`, row.id);
            }
            else
            {
                if(row.id == 0)
                {
                    delete row.id
                    console.log(row);
                    connection.query(`INSERT INTO ${this.table_name} SET ?`, row);
                }
                else
                {
                    connection.query(`UPDATE ${this.table_name} SET ? WHERE id = ?`, [row, row.id]);
                }
            }
        }
    }
}