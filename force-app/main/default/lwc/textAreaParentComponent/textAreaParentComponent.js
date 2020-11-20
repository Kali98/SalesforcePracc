import { LightningElement, track} from 'lwc';

export default class TextAreaParentComponent extends LightningElement {
    @track currentValue


    handleChange(event){
        this.currentValue = event.target.currentValue;
        console.log('PK - current val is: ', this.currentValue);

    }


}