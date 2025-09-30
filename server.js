// server.js

// 1. Import all the necessary libraries
require('dotenv').config(); // Loads environment variables from a .env file
const express = require('express');
const { Pool } = require('pg'); // PostgreSQL client from the 'pg' library
const cors = require('cors');
const bcrypt = require('bcryptjs');

// 2. Initialize the Express app and configure middleware
const app = express();
app.use(cors()); // Enable Cross-Origin Resource Sharing
app.use(express.json()); // Allow the server to parse incoming JSON data

// 3. Configure the connection to your PostgreSQL database using environment variables
const pool = new Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT,
});

// 4. Create your API Endpoint for user registration
app.post('/api/register', async (req, res) => {
    console.log('Received registration request:', req.body);

    // Get all the user data from the request body sent by the app
    const { fullName, age, sex, weight, height, phoneNumber, emergencyContact, email, password } = req.body;

    // Basic validation to make sure required fields are not empty
    if (!fullName || !email || !password) {
        return res.status(400).json({ error: 'Full name, email, and password are required.' });
    }

    try {
        // Securely hash the user's password before saving it
        const hashedPassword = await bcrypt.hash(password, 10);

const queryText = `
    INSERT INTO users (full_name, age, gender, weight_kg, height_cm, phone_number, email, password_hash)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
    RETURNING user_id;
`;


const values = [fullName, age, sex, weight, height, phoneNumber, email, hashedPassword];

        // Execute the query to insert the new user into the database
        const result = await pool.query(queryText, values);
        
       console.log('User registered successfully with ID:', result.rows[0].user_id);
res.status(201).json({ message: 'User registered successfully', userId: result.rows[0].user_id });

    } catch (err) {
        console.error('Error during registration:', err);
        if (err.code === '23505') {
            return res.status(409).json({ error: 'A user with this email already exists.' });
        }
        res.status(500).json({ error: 'Server error during registration.' });
    }
});

// 5. Start the server and listen for requests on a specific port
const PORT = 3001;
app.listen(PORT, () => {
    console.log(`✅ Backend server is running and listening on port ${PORT}`);
});