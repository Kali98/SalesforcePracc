// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

// Opportunity testOpp = new Opportunity(Name = 'testing', CloseDate = Date.today()+2, StageName = 'Prospecting');
// String oppId = '00609000003MkNGAA0';
//insert testOpp;


//Quote testQuote1 = new Quote(Name = 'Test Quote', OpportunityId = '00609000003MkNGAA0');
//Quote testQuote2 = new Quote(Name = 'Test Quote2', OpportunityId = '00609000003MkNGAA0');

//insert testQuote1;
//insert testQuote2;

//List<Quote> quotesToDel = [SELECT Id, OpportunityId, Name FROM Quote WHERE Name = 'quote 2' ];
//delete quotesToDel;

ExternalCallout.makeCall();