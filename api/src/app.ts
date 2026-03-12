import express from 'express';
import type { Request, Response } from 'express';
import type { Context } from 'aws-lambda';

const app = express();
app.use(express.json());

app.get('/', (_req: Request, res: Response) => {
    res.send('Hello World!');
});

export default app;

// app.listen(port, () => {
//   console.log(`Server running at http://localhost:${port}`);
// });