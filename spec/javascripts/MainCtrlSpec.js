describe("MainCtrlSpec", function(){
	beforeEach(module("handson-dds"));

	beforeEach(inject(function($controller){
		ctrl = $controller("MainCtrlSpec", {$scope : scope});
	}));

	it('should agregar un mensaje de bienvenida al scope', function(){
		expect(scope.mensajeBienvenida.toBe("Bienvenido a la red wedding"));
	});
});