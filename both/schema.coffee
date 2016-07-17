Schemas = {}

@Kitas = new Mongo.Collection 'kitas'

Schemas.Kitas = new SimpleSchema
  name:
    type: String
  description:
    type: String
    autoform:
      rows: 4
  phone:
    type: String
  person:
    type: String
    label: 'Kontaktperson'
  progress:
    type: String
    allowedValues: ['noch kein Kontakt', 'Erstkontakt gehabt', 'warten auf Rückmeldung', 'nachhaken']
  status:
    type: String
    allowedValues: ['offen', 'Zusage', 'Absage']
  features:
    type: [Object]
  location:
    type: String
    autoform:
      type: 'map'
      afFieldInput:
        geolocation: true
        searchBox: true
        autolocate: true

Kitas.attachSchema Schemas.Kitas