const express = require("express")
const dotenv = require("dotenv")
const app = express()
dotenv.config(".env");
const { DB_PASSWORD , DB_USER } = process.env;


app.use('/' , (req , res)=>{
    res.send(`Hi users`)
})
app.listen(process.env.PORT , ()=>{
    console.log(`app is running ${process.env.PORT}`)
})