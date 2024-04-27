import express from 'express';

import { problemRouter } from './routes/problem-routes';

const app = express();
const PORT:number = 3000;

app.use('/problems', problemRouter);

app.get('/', (req, res) => {
  res.send('Home Page Test');
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});