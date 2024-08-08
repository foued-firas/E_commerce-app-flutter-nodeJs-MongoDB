//import from packages
const express = require('express');
const mongoose = require('mongoose');
//import from other files
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
//Initialisation
const PORT = 1928;
const app =express();
const DB =
"mongodb+srv://foued:foued123@cluster0.hrmxm12.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
//middleware 
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);



//connections

 mongoose.connect(DB).then(
    ()=> {
        console.log("Connection Successuf");
    }
);

app.listen(PORT ,"0.0.0.0", () =>{
    console.log(`connected at port ${PORT}`);
})
//localhost