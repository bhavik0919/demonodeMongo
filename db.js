var mongoose = require('mongoose');

var conn = mongoose.createConnection('mongodb://192.168.1.33:27017/skillevaluation_qa');
var conn2 = mongoose.createConnection('mongodb://192.168.1.33:27017/skillevaluationmaster');

var Common = require('./app/common');
var uuidv1 = require('uuid/v4');
var moment = require('moment');

var Schema = mongoose.Schema;

conn.once('open', function () {
  console.log('Success Organzer Database connected');
});

conn2.once('open', function () {
  console.log('Success Master Database connected');
});


Organization = conn2.model('Organization', new Schema({
  _id: Schema.Types.String,
  OrganizationName: Schema.Types.String,
  MobileNumber: Schema.Types.String,
  OrganizationUrl: Schema.Types.String,
  ContactPersonName: Schema.Types.String,
  ContactPersonEmail: Schema.Types.String,
  SubscriptionId:Schema.Types.String,
  CreatedBy: Schema.Types.String,
  UpdatedBy: Schema.Types.String,
  CreatedOn: Schema.Types.String,
  UpdatedOn: Schema.Types.String,
  Status: Schema.Types.String,
  LastActionPerformed: Schema.Types.String,
  Version: Number
}));

Subscription = conn2.model('Subscription', new Schema({
  _id: Schema.Types.String,
  SubscriptionName: Schema.Types.String,
  CreatedBy: Schema.Types.String,
  UpdatedBy: Schema.Types.String,
  CreatedOn: Schema.Types.String,
  UpdatedOn: Schema.Types.String,
  Status: Schema.Types.String,
  LastActionPerformed: Schema.Types.String,
  Version: Number
}));

SubscriptionPlanDetail = conn2.model('SubscriptionPlanDetail', new Schema({
  _id: Schema.Types.String,
  SubscriptionId: Schema.Types.String,
  entity: Schema.Types.String,
  limit: Schema.Types.String,
  CreatedBy: Schema.Types.String,
  UpdatedBy: Schema.Types.String,
  CreatedOn: Schema.Types.String,
  UpdatedOn: Schema.Types.String,
  Status: Schema.Types.String,
  LastActionPerformed: Schema.Types.String,
  Version: Number
}));
