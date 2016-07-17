Schemas = {}

@Kitas = new Mongo.Collection 'kitas'

Schemas.Kitas = new SimpleSchema
  name:
    type: String
  description:
    type: String
    label: 'Beschreibung'
    optional: true
    autoform:
      rows: 4
  phone:
    type: String
    optional: true
    label: 'Telefon'
  email:
    type: String
    optional: true
  person:
    type: String
    optional: true
    label: 'Kontaktperson'
  progress:
    type: String
    optional: true
    label: 'Fortschritt'
    allowedValues: ['noch kein Kontakt', 'Erstkontakt gehabt', 'warten auf Rückmeldung', 'nachhaken']
  status:
    type: String
    allowedValues: ['Warteliste', 'Zusage', 'Absage']
    optional: true
  features:
    type: [String]
    optional: true
    autoform:
      type: 'select-checkbox-inline'
      options: ->
        [
          label: 'Gleichaltrige'
          value: 'Gleichaltrige'
        ,
          label: 'Außenbereich'
          value: 'Außenbereich'
        ]
  street:
    type: String
    label: 'Strasse Hausnummer'
  zipCode:
    type: String
    label: 'Postleitzahl Stadt'
  lat:
    type: Number
    decimal: true
    optional: true
    autoValue: ->
      if Meteor.isServer
        geo = new GeoCoder()
        result = geo.geocode "#{@field('street').value} #{@field('zipCode').value}"
        result[0].latitude
    autoform:
      type: "hidden"
      label: false
  lng:
    type: Number
    decimal: true
    optional: true
    autoValue: ->
      if Meteor.isServer
        geo = new GeoCoder()
        result = geo.geocode "#{@field('street').value} #{@field('zipCode').value}"
        result[0].longitude
    autoform:
      type: "hidden"
      label: false
  closingTimes:
    type: [Date]
    label: 'Schließzeiten'
    optional: true
    autoform:
      afFieldInput:
        type: "date"
  responsible:
    type: String
    allowedValues: ['Julika', 'Thomas']
    optional: true
Kitas.attachSchema Schemas.Kitas