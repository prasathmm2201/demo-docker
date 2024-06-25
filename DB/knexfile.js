require('dotenv').config();
module.exports =  {
    client: 'postgresql',
    connection: {
      host: process.env.DB_HOST,
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME,
      port:process.env.DB_PORT,
      connectionString:process.env.DATABASE_URL
    },
    migrations: {
      directory: './migrations',
    },
    seeds: {
      directory: './seeders',
    },
};
