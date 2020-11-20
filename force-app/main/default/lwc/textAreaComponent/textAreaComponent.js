import { LightningElement, api, track } from 'lwc';

export default class TextAreaComponent extends LightningElement {
    @api label;
    @api rows;
    @api cols;
    @api placeholder;
    @track value;
    currentValue = '';

    handleChange(event){
        this.currentValue = event.target.value;
        
        const passValueEvent = new CustomEvent('change', {
            detail: { textAreaContent: this.currentValue }
        });

        console.log('PK - current val is: ', this.currentValue);
        this.dispatchEvent(passValueEvent);
    }


}