import { connection } from '@/global/mysql';

export class model<T>
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
}