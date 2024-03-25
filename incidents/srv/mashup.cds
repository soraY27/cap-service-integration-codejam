using { acme.incmgt, IncidentsService } from './incidents-service';
using { s4 } from './external';
using from '../app/fiori';

extend service IncidentsService with {
  entity Customers as projection on s4.simple.Customers;
}

extend incmgt.Incidents with {
  customer : Association to s4.simple.Customers;
}

annotate IncidentsService.Incidents with @(
  UI: {
    FieldGroup #GeneralInformation : {
      Data: [
        { Value: customer_ID, Label: 'Customer'},
        ...
      ]
    },
  }
);