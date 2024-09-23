require('dotenv').config();
const express = require('express');
const axios = require('axios');
const cors = require('cors');
const path = require('path');

const app = express();
const port = 3000;

// Enable All CORS Requests
app.use(cors());

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'app/views/dashboard/index.html.erb')); 
});

// Define the API endpoint for fetching reservations
app.get('/api/reservations', async (req, res) => {
    try {
      const API_ID = process.env.API_ID;
      const API_KEY = process.env.API_KEY;
      const API_URL = process.env.API_URL;

        // Make the request to the external API
      const response = await axios.get(API_URL, {
        headers: {
            'X-Booked-ApiId': API_ID,
            'X-Booked-ApiKey': API_KEY,
            'Content-Type': 'application/json',
        },
      });
        // Send the API response back to the frontend
        res.json(response.data);
    } catch (error) {
        console.error('Error fetching reservations:', error);

        // Error handling
        if (error.response) {
            // status code out of  range
            res.status(error.response.status).json({
                error: 'API Error',
                details: error.response.data,
            });
        } else if (error.request) {
            // no response was received
            res.status(500).json({
                error: 'No Response from API',
                details: error.message,
            });
        } else {
            // Something else lol xd haha
            res.status(500).json({
                error: 'Request Error',
                details: error.message,
            });
        }
    }
});

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
