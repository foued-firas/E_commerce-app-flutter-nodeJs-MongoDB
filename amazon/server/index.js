//import from packages
const express = require('express');
const mongoose = require('mongoose');
//import from other files
const authRouter = require('./routes/auth');
//Initialisation
const PORT = 1928;
const app =express();
const DB =
"mongodb+srv://firasfouad:mtc1965@cluster0.6imcefj.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
//middleware 
app.use(express.json());
app.use(authRouter);


//connections

 mongoose.connect(DB).then(
    ()=> {
        console.log("Connection Successuf");
    }
);

app.listen(PORT , () =>{
    console.log(`connected at port ${PORT}`);
})
//localhost