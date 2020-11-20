import { LightningElement, track} from 'lwc';

export default class TextAreaParentComponent extends LightningElement {
    @track textAreaContent


    handleChange(event){
        this.textAreaContent = event.detail.textAreaContent;
        console.log('PK - textAreaContent is: ', this.textAreaContent);

    }


}