var path = require('path');
require('dotenv').config()

const config = {
    migrationsDir: path.resolve(process.cwd(), 'db', 'migrations'),
    adapter: 'mysql',
    host: process.env.DB_HOST,
    db: process.env.DATABASE,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT,
    multipleStatements: true
}

require('sql-migrations').run(config);
