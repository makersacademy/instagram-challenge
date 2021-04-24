const express = require('express');
const { route } = require('.');
const router = express.Router();
const Post = require('../models/post');

// All Users Route
router.get('/', async (req, res) => {});

// New User Route
router.get('/new', (req, res) => {});

// Create User Route
router.post('/', async (req, res) => {});

module.exports = router;
