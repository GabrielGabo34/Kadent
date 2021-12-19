import { Application } from 'express';
import { listReserva } from './controllers/reserva_controllers';
export function routes(app: Application){
    app.get('/api/reserva', listReserva);
}