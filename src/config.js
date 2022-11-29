import { config } from "dotenv";
config();

export const PORT = process.env.PORT || 4000;
export const MONGODB_URI = ("mongodb://"+process.env.MONGODB_URI+"/"+process.env.MONGODB_DB) 
    || "mongodb://localhost/notesdb";
