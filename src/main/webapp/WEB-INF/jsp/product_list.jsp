<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Список товаров</title>
<link href="../webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- Include jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Include Date Range Picker -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />

<script>
	$(document).ready(
			function() {
				var date_input = $('input[name="date"]'); //our date input has the name "date"
				var container = $('.bootstrap-iso form').length > 0 ? $(
						'.bootstrap-iso form').parent() : "body";
				date_input.datepicker({
					format : 'yyyy-mm-dd',
					container : container,
					todayHighlight : true,
					autoclose : true,
				})
			})
</script>
<script type="text/javascript">
	$(document).ready(update_table());
	
	function cleanModal() {
		document.getElementById("editId").innerHTML = "";
		document.getElementById("editText").value = "";
		document.getElementById("editTextarea").value = "";
		document.getElementById("editDate").value = "";
		document.getElementById("editNumber").value = "";
		document.getElementById("editCheckbox").checked  = false;
		document.getElementById("notIntID").innerHTML="";
	}
	function fillModel(row) {
		var row = document.getElementById("bodyId").rows[row].cells;
		var id = row[0].innerHTML;
		var name = row[1].innerHTML;
		var description = row[2].innerHTML;
		var date = row[3].innerHTML;
		var place_storage = row[4].innerHTML;
		var reserved = row[5].innerHTML;
		document.getElementById("editId").innerHTML = id;
		document.getElementById("editText").value = name;
		document.getElementById("editTextarea").value = description;
		document.getElementById("editDate").value = date;
		document.getElementById("editNumber").value = place_storage;
		document.getElementById("editCheckbox").checked = (reserved=='true');
		document.getElementById("newProduct").click();
		
	}
	function delete_row(id) {
		$.ajax({
			type : 'DELETE',
			url : '/delete_user/' + id,
			success : function(data) {
				update_table();
				
			}
		});
	}
	function sendRecord(data){
		$.ajax({
			type : 'POST',
			url : '/sendRecord',
			contentType : "application/json",
			processData:false,
			data: data,
			success : function(data) {
				update_table();
			}
		});
	}

	function update_table() {
		$
				.get(
						"/get_users",
						function(data) {
							let table = "";
							for ( var line in data) {
								table = table
										+ '<tr id = "trNum_'+data[line].id+'">'
										+ "<td>"
										+ data[line].id
										+ "</td>"
										+ "<td>"
										+ data[line].name
										+ "</td>"
										+ "<td>"
										+ data[line].description
										+ "</td>"
										+ "<td>"
										+ data[line].createdDate
										+ "</td>"
										+ "<td>"
										+ data[line].placeStorage
										+ "</td>"
										+ "<td>"
										+ data[line].reserved
										+ "</td>"
										+ "<td>"
										+ '<button class="btn btn-primary" type="button" onClick="fillModel('
										+ line
										+ ')">Изменить</button>'
										+ "</td>"
										+ "<td>"
										+ '<button class="btn btn-primary" type="button" onclick="delete_row('+data[line].id+')">Удалить</button>'
										+ "</td>" + "</tr>"
							}
							$("#bodyId").html(table);
							
						});
	}
</script>
</head>
<body>




	<div class="container">
		<h2>Список товаров</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="row">ИН</th>
					<th scope="row">Название</th>
					<th scope="row">Описание</th>
					<th scope="row">Дата</th>
					<th scope="row">Номер ячейки</th>
					<th scope="row">Флаг резервирования</th>
					<th scope="row">Изменить</th>
					<th scope="row">Удалить</th>
				</tr>
			</thead>
			<tbody id="bodyId">
			</tbody>
		</table>
		<!-- Button to Open the Modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal"
			id="newProduct" data-target="#myModal">Новая запись</button>

		<!-- The Modal -->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Запись</h4>
						<button type="button" class="close" id="editCancelTop"
							data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<h3>Товар</h3>
					</div>
					<div class="bootstrap-iso">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<form method="post">
										<div class="form-group ">
											<label class="control-label" for="text">ИД:</label> <label
												class="control-label" id="editId" for="text"></label>
										</div>
										<div class="form-group ">
											<label class="control-label  requiredField" for="text">
												Название товара <span class="asteriskField"> * </span>
											</label> 
											<input class="form-control" id="editText" name="text"type="text" />
										</div>
										<div class="form-group ">
											<label class="control-label requiredField" for="textarea">
												Описание товара <span class="asteriskField"> * </span>
											</label>
											<textarea class="form-control" cols="40" id="editTextarea"
												name="textarea" rows="10"></textarea>
										</div>
										<div class="form-group ">
											<label class="control-label requiredField" for="date">
												Дата добавления <span class="asteriskField"> * </span>
											</label> <input class="form-control" id="editDate" name="date"
												placeholder="ГГГГ/ММ/ДД" type="text" />
										</div>
										<div class="form-group ">
											<label class="control-label " for="number"> Ячейка хранения </label>
											<label  color="red"> <font color="red" id="notIntID"></font> </label>
											
											 <input class="form-control" id="editNumber" name="number" type="text" />
										</div>
										<div class="form-group ">
											<div class=" ">
												<div class="checkbox">
													<label class="checkbox"> <input name="checkbox"
														id="editCheckbox" type="checkbox"
														value="Резервирование товара" />Резервирование товара
													</label>
												</div>
											</div>
										</div>

									</form>
								</div>
							</div>
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">

						<button class="btn btn-primary " name="submit" type="submit"
							id="submitEdit">OK</button>

						<button type="button" class="btn btn-danger" data-dismiss="modal"
							id="editCancelBot">Отмена</button>
					</div>

				</div>
			</div>
		</div>
	</div>
	<script>
		function getEditData(){
			var data = new Object();
			data.id= parseInt(document.getElementById("editId").innerHTML);
			data.name=document.getElementById("editText").value;
			data.description=document.getElementById("editTextarea").value;
			data.createdDate=document.getElementById("editDate").value;
			data.placeStorage=parseInt(document.getElementById("editNumber").value);
			data.reserved=document.getElementById("editCheckbox").checked;
			var jsonData=JSON.stringify(data);
			return jsonData;
		}
		

	</script>
	
	<script>
		$("#submitEdit").click(function() {
			var placeStorage=document.getElementById("editNumber").value;
			if (/^\d+$/.test(placeStorage)){
				var data = new Object();
				data.id= parseInt(document.getElementById("editId").innerHTML);
				data.name=document.getElementById("editText").value;
				data.description=document.getElementById("editTextarea").value;
				data.createdDate=document.getElementById("editDate").value;
				data.placeStorage=placeStorage;
				data.reserved=document.getElementById("editCheckbox").checked;
				var jsonData=JSON.stringify(data);
				sendRecord(jsonData);
				document.getElementById("newProduct").click();
				cleanModal();
			}else{
				document.getElementById("notIntID").innerHTML="Введите целое число"
			}
			
		});
		$("#editCancelBot").click(function() {
			cleanModal();
		});
		$("#editCancelTop").click(function() {
			cleanModal();
		});
	</script>
</body>
</html>