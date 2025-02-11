<div class="row">
    <div class="col-sm-5">
        <div class="form-group mb-3">
            <label class="mb-1 d-block">Product</label>
            <select name="product_id[]" class="form-control proSel">
                <option>Please Select</option>
                @foreach($products as $product)
                    <option value="{{ $product->id }}" data-price="{{ $product->price }}">
                        {{ $product->title }}
                    </option>
                @endforeach
            </select>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group mb-3">
            <label class="mb-1 d-block">Yards</label>
            <input type="number" name="yards[]" class="form-control proQty" min="1"
                   step="any" value="0">
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group mb-3">
            <label class="mb-1 d-block">Items Sold</label>
            <input type="number" name="items_sold[]" class="form-control" min="0"
                   step="any" value="0">
        </div>
    </div>
    <div class="col-sm-1">
        <a href="javascript:;" class="removeRow" data-id="0">
            <i class="ion-md-close"></i>
        </a>
    </div>
    <input type="hidden" name="unit_price[]" class="form-control proUPrice" min="1" value="0" />
    <input type="hidden" class="form-control proPrice" name="price[]" value="0" />
</div>
