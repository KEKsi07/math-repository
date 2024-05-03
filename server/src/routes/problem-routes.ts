import * as express from 'express';

import { pool } from '../config/config';
import { Problem } from '../model/problem';
import { Hint } from '../model/hint';


export const problemRouter = express.Router();

problemRouter.get('/', (req, res) => {

  let data: Problem[] = [];
  pool.query('SELECT * FROM problem', (err, rows) => {
    if(err) {
      console.log(err);
      res.status(500).send('Server error');
    }
    else {
      for(let i = 0; i < rows.length; i++)
      {
        data.push(new Problem(rows[i].problem_id, rows[i].problem_text));
      }
      res.status(200).send(data);
    }
  })

});

problemRouter.get('/:id', (req, res) => {

  let id: string = req.params.id;
  let data: Problem[] = [];
  pool.query('SELECT * FROM problem WHERE problem_id = ?', [id], (err, rows) => {
    if(err) {
      console.log(err);
      res.status(500).send('Server error');
    }
    else if (rows.length > 0)
    {
      res.status(200).send(new Problem(rows[0].problem_id, rows[0].problem_text));
    }
    else {
      res.status(404).send("Problem not found");
    }
  })

});

problemRouter.get('/:id/hints', (req, res) => {

  let id: string = req.params.id;
  let data: Hint[] = [];
  pool.query('SELECT * FROM hint WHERE problem_id = ?', [id], (err, rows) => {
    if(err) {
      console.log(err);
      res.status(500).send('Server error');
    }
    else {
      for(let i = 0; i < rows.length; i++)
      {
        data.push(new Hint(rows[i].hint_id, rows[i].hint_text, rows[i].problem_id));
      }
      res.status(200).send(data);
    }
  })

});
