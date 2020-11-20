import { LightningElement, api } from 'lwc';

export default class TextAreaComponent extends LightningElement {
    @api label;
    @api rows;
    @api cols;
    @api placeholder;
    currentValue = null;

    handleChange(event){
        this.currentValue = event.target.value;
        console.log('PK - current val is: ', this.currentValue);

    }


}