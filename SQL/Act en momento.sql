--Nombre , salario + 150 y lo ordenamos de departamento y de salario descendente mente .
--Nombre , fecha contratación , salario y departamento .

SELECT ename AS "Nombre", hiredate AS "Fecha" , sal AS "Salario" , deptno AS "Departamento"
FROM emp
WHERE sal>1500 
ORDER BY deptno , sal DESC; 