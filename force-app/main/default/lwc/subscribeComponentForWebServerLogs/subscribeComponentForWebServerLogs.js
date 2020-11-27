import { LightningElement, track} from 'lwc';
import { subscribe, unsubscribe, onError, setDebugFlag, isEmpEnabled } from 'lightning/empApi';

export default class EmpApiLWC extends LightningElement {
    channelName = '/event/Web_Server_Log__e';
    isSubscribeDisabled = false;
    isUnsubscribeDisabled = !this.isSubscribeDisabled;

    @track requestBody = '';
    @track responseBody = '';  
    @track statusCode = '';
    @track listOfLogs = [];
  
    subscription = {};  
  
    // Tracks changes to channelName text field  
    handleChannelName(event) {  
        this.channelName = event.target.value;  
    }  
  
    // Handles subscribe button click  
    handleSubscribe() {  
        // Callback invoked whenever a new event message is received  
        const messageCallback = ( response ) => {  
            //console.log( 'New message received : ', JSON.stringify( response ) );  
            // Response contains the payload of the new message received  
            //this.strResponse = JSON.stringify( response.data.payload.Status__c );  
            this.responseBody = (JSON.stringify(response.data.payload.Response_Body__c));
            this.requestBody = (JSON.stringify(response.data.payload.Request_Body__c));
            this.statusCode = (JSON.stringify(response.data.payload.Status__c));                     
               
            this.listOfLogs.push({
                response: this.responseBody,
                request: this.requestBody,
                status: this.statusCode
            });
            console.log(this.listOfLogs[0].status);

 
        };  
  
        // Invoke subscribe method of empApi. Pass reference to messageCallback  
        subscribe( this.channelName, -1, messageCallback ).then(response => {  
            // Response contains the subscription information on successful subscribe call  
            console.log( 'Successfully subscribed to : ', JSON.stringify( response.channel ) );  
            this.subscription = response;  
            this.toggleSubscribeButton( true );  
        });  
    }  
  
    // Handles unsubscribe button click  
    handleUnsubscribe() {  
        this.toggleSubscribeButton( false );  
  
        // Invoke unsubscribe method of empApi  
        unsubscribe(this.subscription, response => {  
            console.log( 'unsubscribe() response: ', JSON.stringify( response ) );  
            // Response is true for successful unsubscribe  
        });  
    }  
  
    toggleSubscribeButton( enableSubscribe ) {  
  
        this.isSubscribeDisabled = enableSubscribe;  
        this.isUnsubscribeDisabled = !enableSubscribe;  
  
    }  
  
    registerErrorListener() {  
  
        // Invoke onError empApi method  
        onError(error => {  
            console.log( 'Received error from server: ', JSON.stringify( error ) );  
            // Error contains the server-side error  
        });  
  
    }  

}