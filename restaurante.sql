-- Ejercicios restaurante

use clase0910_restaurante

-- Para cada plato, se desea obtener su nombre, descripción, nivel de dificultad (de elaboración), una foto y el precio final para el cliente. 	
SELECT p.nombre_plato AS nombre_plato, p.descripcion AS descripcion_plato, d.descripcion AS nivel_dificultad, pr.precio AS precio, pr.foto AS foto
FROM restaurante.Plato p
JOIN restaurante.Dificultad d ON p.id_dificultad = d.iddificultad
JOIN restaurante.PlatoReceta pr ON pr.idPlato = p.idPlato

-- Cada plato pertenece a una categoría.
SELECT p.nombre_plato AS n_plato, c.nombre_categoria AS n_categoria
FROM restaurante.plato p
JOIN restaurante.categoria c ON p.idcategoria = c.idcategoria

-- Las categorías se caracterizan por su nombre, una breve descripción y el nombre del encargado.
SELECT p.encargado AS encargado, c.nombre_categoria AS categoria_plato, c.descr_categoria AS desc_cat
FROM restaurante.plato p
JOIN restaurante.categoria c ON p.idCategoria = c.IdCategoria;

-- Además de los platos, se desea conocer las recetas para su realización, con la lista de ingredientes necesarios,
-- aportando la cantidad requerida, las unidades de medida (gramos, litros, etc. . . ) y cantidad actual en el almacén	
SELECT p.nombre_plato AS plato, ri.cantidad_ingrediente AS cant_ing, ri.unidad_medida AS uni_med, r.descripcion AS descr_receta
FROM restaurante.plato p
JOIN restaurante.platoreceta pr ON pr.idplato = p.idplato
JOIN restaurante.RecetaIngrediente ri ON ri.idReceta = pr.idReceta
JOIN restaurante.Receta r ON ri.IdReceta = r.idReceta
