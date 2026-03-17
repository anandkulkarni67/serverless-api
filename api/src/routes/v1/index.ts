import { Router } from 'express';

import books from './books.route';

const router = Router();

router.use('/greet', books);

export default router;