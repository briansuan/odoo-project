

odoo.define('point_of_sale.Orderline', function(require) {
    'use strict';

    const PosComponent = require('point_of_sale.PosComponent');
    const ProductScreen = require('point_of_sale.ProductScreen');
    const Registries = require('point_of_sale.Registries');

    class Orderline extends PosComponent {
        selectLine() {
            this.trigger('select-line', { orderline: this.props.line });
        }
        lotIconClicked() {
            this.trigger('edit-pack-lot-lines', { orderline: this.props.line });
        }
        // ***** Added function ***** //
        setNote() {
            const selectedOrderline = this.env.pos.get_order().get_selected_orderline();

            var note = document.getElementById("order_note_input").value;

            selectedOrderline.set_customer_note(note);
            
            return;
        }
        get addedClasses() {
            return {
                selected: this.props.line.selected,
            };
        }
        get customerNote() {
            return this.props.line.get_customer_note();
        }
    }


    Orderline.template = 'Orderline';

    Registries.Component.add(Orderline);

    return Orderline;
});







