         
<!-- Update Fruit Details  modal content -->
	<div id="updateit" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h3 id="myModalLabel">Update Fruit Name</h3>
            </div>
            <div class="modal-body">
				<form class="form-horizontal" method="post" action="FruitUMy.php">

					<div class="control-group">
						<label class="control-label" for="Fruitname1">Fruit Name</label>
							<div class="controls">
								<select name="Fruitname1" id="Fruitname1"  required="required">
									<option value="">Current Fruit Name</option>
								</select>
							</div>
					</div>
                     <div class="control-group">
						<label class="control-label" for="Fruitname2">Fruit Name</label>
						<div class="controls">
							<select name="Fruitname2" id="Fruitname2"  required="required">
							<option value="">New Fruit Name</option>
							<option value="Banana">Banana</option>
							<option value="Pear">Pear</option>
							<option value="Orange">Orange</option>
							<option value="Kiwi">Kiwi</option>
							<option value="Mango">Mango</option>       
							<option value="Lemon">Lemon</option>
							<option value="Peach">Peach</option>
							<option value="Cherry">Cherry</option>
							<option value="Strawberry">Strawberry</option>
							<option value="Apricot">Apricot</option>
							<option value="Apple">Apple</option>
							</select>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<input type="submit" name="submit" id="submit" class="btn btn-warning" value="Change Fruit Name">
						</div>
					</div>
				</form>

            </div>
    </div>