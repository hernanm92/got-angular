// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require angular.min
//= require_tree .

var app = angular.module("handson-dds", []);  //angular usa modulos como node
//angular es el objeto que te da angular para crear sus componentes


//tenemos que aclarar en donde va a estar ese modulo en el html (ng-module="") ej: en layout/aplication
app.controller("MainCtrl", function($scope, $http){ //aca pongo todo lo que se puede acceder desde la vista (el $scope es el ViewModel)
	/*$scope.mensajeBienvenida = ("Bienvenidos a la red wedding");

	$scope.casas = [
		{
			nombre:"Bolton",
			patrimonio: 12343,
			fundada_en: 130
		},
		{
			nombre:"Lannister",
			patrimonio: 35025,
			fundada_en: 529
		},
		{
			nombre:"Baratheon",
			patrimonio: 38980,
			fundada_en: 130
		},
	];*/

	var Naval = function(fuerza){ //uso prototipos para simular clases
		this.tipo = "Naval";
		this.casa = fuerza.casa;
	};
	Naval.prototype.poder = function(){
		return 90;
	};

	var Terrestre = function(fuerza){ 
		this.tipo = "Terrestre";
		this.cantidadSoldados = fuerza.cantidad_soldados;
		this.casa = fuerza.casa;
	};
	Terrestre.prototype.poder = function(){
		return this.cantidadSoldados * 50;
	};

	var Aerea = function(fuerza){ 
		this.tipo = "Aerea";
		this.cantidadDragones = fuerza.cantidad_dragones;
		this.casa = fuerza.casa;
	};
	Aerea.prototype.poder = function(){
		return this.cantidadDragones * 100;
	};

	//ahora quiero traerme las casas, pero haciendo un get (que me trae un json)
	var promise = $http.get("/casas.json")  //el promise sirve para que no se haga el callback hell
	$scope.estaCargando = true;
	promise.success(function(response){
		$scope.estaCargando = false;//dejo de cargar
		$scope.casas = response.casas;
	});
	promise.error(function(){
		alert("fallo!");
	});

	$scope.refresh = function(){
		var promise = $http.get("/casas.json")  //el promise sirve para que no se haga el callback hell
		$scope.refreshing = true;
		promise.success(function(response){
			$scope.refreshing = false;//dejo de cargar
			$scope.casas = response.casas;
		});
	};

	$scope.mostrarFuerza = false; //al parecer no se banca variables y funciones con el mismo nombre
	$scope.mostrarFuerzas = function(id){ //para declarar funciones
		var promise = $http.get("/fuerzas.json?casa="+id) 
		promise.success(function(response){
			$scope.mostrarFuerza = true;
			$scope.mostrarHeroe = false;
			$scope.fuerzas = response.fuerzas.map(traerFuerza);
			angular.forEach($scope.casas, function(casa) {
			  if (casa.id == id) {
				$scope.casa = casa;
			  };
			});
		});
		promise.error(function(){
			alert("no anduvo");
		});
	};

	var traerFuerza = function(fuerza){
		switch(fuerza.type){
			case "Naval": return new Naval(fuerza);
			case "Terrestre": return new Terrestre(fuerza);
			case "Aerea": return new Aerea(fuerza);
		}
	};

	$scope.mostrarHeroe = false; //al parecer no se banca variables y funciones con el mismo nombre
	$scope.mostrarHeroes = function(id){ //para declarar funciones
		var promise = $http.get("/heroes.json?casa="+id) 
		promise.success(function(response){
			$scope.mostrarHeroe = true;
			$scope.mostrarFuerza = false;
			$scope.heroes = response.heroes;
			angular.forEach($scope.casas, function(casa) {
			  if (casa.id == id) {
				$scope.casa = casa;
			  };
			});
		});
		promise.error(function(){
			alert("no anduvo");
		});
	};

	$scope.creandoCasa = false;
	$scope.agregarCasa = function(){
		$scope.creandoCasa = true;
	};

	$scope.crearCasa = function(){
		var promise = $http.post("/crearCasa?casa=jsonCasa") //solo con el post ya haria el create (por REST)
		promise.success(function(response){ //el refresh lo tendria que hacer aca mismo
			$scope.refresh();
		});
	}

	$scope.ocultar = function(){ //vuelve al estado inicial
        $scope.mostrarFuerza = false;
		$scope.mostrarHeroe = false;
		$scope.creandoCasa = false;
	};

});//el scope no es global