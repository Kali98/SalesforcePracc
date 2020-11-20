import { LightningElement, api } from 'lwc';

export default class TextAreaComponent extends LightningElement {
    @api label;
    @api rows;
    @api cols;
    @api placeholder;
    textAreaContent;

    handleChange(event){
        this.textAreaContent = event.target.value;
        console.log("Byle co");
        const passValueEvent = new CustomEvent('change', {
            detail: { textAreaContent: this.textAreaContent }
        });

        console.log('PK - current val is: ', this.textAreaContent);
        this.dispatchEvent(passValueEvent);
    }


}