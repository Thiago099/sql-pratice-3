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
        return await new Promise<T[]>((resolve, reject) =>{
            connection.query(`SELECT * FROM ${this.table_name}`, function (error, result) {
                if (error) reject(error);
                resolve(result)
            });
        })
    }
    async save(data: T[]) {
        const promises = []
        for(const row of data)
        {
            if(row.delete)
            {
                if(row.id)
                {
                    promises.push(new Promise(
                        (resolve, reject) => 
                            connection.query(`DELETE FROM ${this.table_name} WHERE id = ?`, row.id, 
                                (error, result) => 
                                {
                                    if (error) reject(error);
                                    resolve(result)
                                }
                            )
                        )
                    )
                }
            }
            else
            {
                if(row.id == 0)
                {
                    delete row.id
                    promises.push(new Promise(
                        (resolve, reject) => 
                            connection.query(`INSERT INTO ${this.table_name} SET ?`, row, 
                                (error, result) =>
                                {
                                    if (error) reject(error);
                                    resolve(result)
                                } 
                            )
                        )
                    )
                }
                else
                {
                    promises.push(new Promise(
                        (resolve, reject) => 
                            connection.query(`UPDATE ${this.table_name} SET ? WHERE id = ?`, [row, row.id], 
                                (error, result)  => 
                                {
                                    if (error) reject(error);
                                    resolve(result)
                                }
                            )
                        )
                    )
                }
            }
            await Promise.all(promises)
        }
    }
}