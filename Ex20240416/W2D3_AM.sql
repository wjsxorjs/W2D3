
-- ====================| 2024.04.16 AM |=========================

-- 		조인(JOIN)은 데이터베이스의 테이블 간의 결합을 의미한다.
-- 		여러 개의 테이블에 자원들이 흩어져있는 상태의 데이터를 
-- 		마치 하나의 테이블에서 결과를 내고싶을 때 JOIN을 사용한다.


-- 		예를 들어 원하는 결과가 다음과 같다면
-- 		 사번,이름,직종,입사일, 부서코드,부서명
-- 		 |---- emp ---- | |-- dept --|
-- 		이렇게 하나의 테이블에 있는 것처럼 결과를 얻기 위해
-- 		여러 개의 테이블 간 기본키와 외래키의 연결을 이용하여
-- 		JOIN을 사용할 때 가능하다.

SELECT empno, ename, job, hiredate, d.deptno, dname
FROM emp e INNER JOIN dept d -- 별칭 부여 필수
ON e.deptno = d.deptno
;

-- 조인의 종류
-- 	- INNER JOIN: 교집합
SELECT *
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno
;

-- 예) 각 부서별 도시명을 출력하라
SELECT d.deptno, d.dname, d.loc_code, l.city
FROM dept d INNER JOIN locations l
ON d.loc_code = l.loc_code
;

-- 





SELECT empno, ename, job, hiredate, d.deptno, dname
FROM emp e LEFT JOIN dept d -- 별칭 부여 필수
ON e.deptno = d.deptno
;

SELECT e.empno, e.ename, e.job, e.hiredate, d.deptno, d.dname
FROM emp e RIGHT JOIN dept d -- 별칭 부여 필수
ON e.deptno = d.deptno
;

-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 