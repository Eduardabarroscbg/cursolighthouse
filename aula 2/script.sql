-- Nome e preço de todos os produtos
select ProductName, UnitPrice
from Product
order by UnitPrice desc;

-- Produtos com mais de 20 unidades no estoque,
-- e custam mais de 50 reais
select ProductName, UnitPrice, UnitsInStock
from Product p
where p.UnitsInStock > 20
and p.UnitPrice > 50;

--Valor total vendido por produto
select ProductId, sum (UnitPrice * Quantity) as valorTotal
from OrderDetail
group by ProductId
order by valorTotal;

-- Valor médio dos pedidos
select avg(UnitPrice * Quantity ) as valorMedio
from OrderDetail;

-- Product + Category
select Product.ProductName, Product.CategoryId, Category.CategoryName
from Product
inner join Category
on Product.CategoryId = Category.Id
order by Category.CategoryName;

-- 3 categorias de produtos que mais geraram receita
select c.CategoryName, sum(od.UnitPrice * od.Quantity) as valorTotal
from OrderDetail od
inner join Product p 
on od.ProductId = p.Id 
inner join Category c
on p.CategoryId = c.Id 
group by c.CategoryName 
order by valorTotal desc 
limit 3;