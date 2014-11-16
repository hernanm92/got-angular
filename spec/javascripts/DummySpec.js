describe("Un test dummy", function() {
  var contador;

  beforeEach(function () {
    contador = 0;
  });

  it("deberia pasar", function () {
    expect(1).toBe(1);
  });

  it("puede usar variables compartidas", function() {
    contador = 23;
    expect(contador).toEqual(23);
  });

  it("corre el beforeEach antes de cada it", function() {
    contador++;
    expect(contador).toEqual(1);
  });

  describe("puede comparar dos objetos cualesquiera", function () {  //creo que es un test anidado
    var jaime1, jaime2;

    beforeEach(function() {
      jaime1 = {
        nombre: "Jaime Lannister",
        casa: "Lannister",
        vicios: ["reyes", "hermanas"]
      };

      jaime2 = {
        nombre: "Jaime Lannister",
        casa: "Lannister",
        vicios: ["reyes", "hermanas"]
      };
    });

    it("por valor", function() {
      expect(jaime1).toEqual(jaime2);
    });

    it("por referencia", function() {
      expect(jaime1).not.toBe(jaime2);
    });
  });
});
