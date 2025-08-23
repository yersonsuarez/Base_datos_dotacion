--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9
-- Dumped by pg_dump version 17.5

-- Started on 2025-08-22 21:29:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 2384027)
-- Name: dotacion; Type: SCHEMA; Schema: -; Owner: Comfe_owner
--

CREATE SCHEMA dotacion;


ALTER SCHEMA dotacion OWNER TO "Comfe_owner";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 2384095)
-- Name: cantidad; Type: TABLE; Schema: dotacion; Owner: Comfe_owner
--

CREATE TABLE dotacion.cantidad (
    id_cantidad integer NOT NULL,
    descripcion character varying(100) NOT NULL,
    cantidad integer NOT NULL,
    CONSTRAINT cantidad_cantidad_check CHECK ((cantidad > 0))
);


ALTER TABLE dotacion.cantidad OWNER TO "Comfe_owner";

--
-- TOC entry 225 (class 1259 OID 2384094)
-- Name: cantidad_id_cantidad_seq; Type: SEQUENCE; Schema: dotacion; Owner: Comfe_owner
--

CREATE SEQUENCE dotacion.cantidad_id_cantidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE dotacion.cantidad_id_cantidad_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 225
-- Name: cantidad_id_cantidad_seq; Type: SEQUENCE OWNED BY; Schema: dotacion; Owner: Comfe_owner
--

ALTER SEQUENCE dotacion.cantidad_id_cantidad_seq OWNED BY dotacion.cantidad.id_cantidad;


--
-- TOC entry 222 (class 1259 OID 2384079)
-- Name: cargo; Type: TABLE; Schema: dotacion; Owner: Comfe_owner
--

CREATE TABLE dotacion.cargo (
    id_cargo integer NOT NULL,
    nombre_cargo character varying(100) NOT NULL,
    descripcion text
);


ALTER TABLE dotacion.cargo OWNER TO "Comfe_owner";

--
-- TOC entry 221 (class 1259 OID 2384078)
-- Name: cargo_id_cargo_seq; Type: SEQUENCE; Schema: dotacion; Owner: Comfe_owner
--

CREATE SEQUENCE dotacion.cargo_id_cargo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE dotacion.cargo_id_cargo_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 221
-- Name: cargo_id_cargo_seq; Type: SEQUENCE OWNED BY; Schema: dotacion; Owner: Comfe_owner
--

ALTER SEQUENCE dotacion.cargo_id_cargo_seq OWNED BY dotacion.cargo.id_cargo;


--
-- TOC entry 230 (class 1259 OID 2449419)
-- Name: dotacion_entregada; Type: TABLE; Schema: dotacion; Owner: Comfe_owner
--

CREATE TABLE dotacion.dotacion_entregada (
    id_entrega integer NOT NULL,
    id_empleado integer NOT NULL,
    id_proveedor integer NOT NULL,
    id_cantidad integer NOT NULL,
    fecha_entrega date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE dotacion.dotacion_entregada OWNER TO "Comfe_owner";

--
-- TOC entry 229 (class 1259 OID 2449418)
-- Name: dotacion_entregada_id_entrega_seq; Type: SEQUENCE; Schema: dotacion; Owner: Comfe_owner
--

CREATE SEQUENCE dotacion.dotacion_entregada_id_entrega_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE dotacion.dotacion_entregada_id_entrega_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 229
-- Name: dotacion_entregada_id_entrega_seq; Type: SEQUENCE OWNED BY; Schema: dotacion; Owner: Comfe_owner
--

ALTER SEQUENCE dotacion.dotacion_entregada_id_entrega_seq OWNED BY dotacion.dotacion_entregada.id_entrega;


--
-- TOC entry 220 (class 1259 OID 2384070)
-- Name: empleado; Type: TABLE; Schema: dotacion; Owner: Comfe_owner
--

CREATE TABLE dotacion.empleado (
    id_empleado integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    documento character varying(20) NOT NULL,
    fecha_ingreso date NOT NULL,
    id_cargo integer,
    id_talla integer
);


ALTER TABLE dotacion.empleado OWNER TO "Comfe_owner";

--
-- TOC entry 219 (class 1259 OID 2384069)
-- Name: empleado_id_empleado_seq; Type: SEQUENCE; Schema: dotacion; Owner: Comfe_owner
--

CREATE SEQUENCE dotacion.empleado_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE dotacion.empleado_id_empleado_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 219
-- Name: empleado_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: dotacion; Owner: Comfe_owner
--

ALTER SEQUENCE dotacion.empleado_id_empleado_seq OWNED BY dotacion.empleado.id_empleado;


--
-- TOC entry 228 (class 1259 OID 2384103)
-- Name: proveedor; Type: TABLE; Schema: dotacion; Owner: Comfe_owner
--

CREATE TABLE dotacion.proveedor (
    id_proveedor integer NOT NULL,
    nombre character varying(100) NOT NULL,
    contacto character varying(100),
    telefono character varying(20),
    direccion character varying(150)
);


ALTER TABLE dotacion.proveedor OWNER TO "Comfe_owner";

--
-- TOC entry 227 (class 1259 OID 2384102)
-- Name: proveedor_id_proveedor_seq; Type: SEQUENCE; Schema: dotacion; Owner: Comfe_owner
--

CREATE SEQUENCE dotacion.proveedor_id_proveedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE dotacion.proveedor_id_proveedor_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 227
-- Name: proveedor_id_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: dotacion; Owner: Comfe_owner
--

ALTER SEQUENCE dotacion.proveedor_id_proveedor_seq OWNED BY dotacion.proveedor.id_proveedor;


--
-- TOC entry 224 (class 1259 OID 2384088)
-- Name: tallas; Type: TABLE; Schema: dotacion; Owner: Comfe_owner
--

CREATE TABLE dotacion.tallas (
    id_talla integer NOT NULL,
    tipo_prenda character varying(50) NOT NULL,
    talla character varying(20) NOT NULL
);


ALTER TABLE dotacion.tallas OWNER TO "Comfe_owner";

--
-- TOC entry 223 (class 1259 OID 2384087)
-- Name: tallas_id_talla_seq; Type: SEQUENCE; Schema: dotacion; Owner: Comfe_owner
--

CREATE SEQUENCE dotacion.tallas_id_talla_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE dotacion.tallas_id_talla_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 223
-- Name: tallas_id_talla_seq; Type: SEQUENCE OWNED BY; Schema: dotacion; Owner: Comfe_owner
--

ALTER SEQUENCE dotacion.tallas_id_talla_seq OWNED BY dotacion.tallas.id_talla;


--
-- TOC entry 3218 (class 2604 OID 2384098)
-- Name: cantidad id_cantidad; Type: DEFAULT; Schema: dotacion; Owner: Comfe_owner
--

ALTER TABLE ONLY dotacion.cantidad ALTER COLUMN id_cantidad SET DEFAULT nextval('dotacion.cantidad_id_cantidad_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 2384082)
-- Name: cargo id_cargo; Type: DEFAULT; Schema: dotacion; Owner: Comfe_owner
--

ALTER TABLE ONLY dotacion.cargo ALTER COLUMN id_cargo SET DEFAULT nextval('dotacion.cargo_id_cargo_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 2449422)
-- Name: dotacion_entregada id_entrega; Type: DEFAULT; Schema: dotacion; Owner: Comfe_owner
--

ALTER TABLE ONLY dotacion.dotacion_entregada ALTER COLUMN id_entrega SET DEFAULT nextval('dotacion.dotacion_entregada_id_entrega_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 2384073)
-- Name: empleado id_empleado; Type: DEFAULT; Schema: dotacion; Owner: Comfe_owner
--

ALTER TABLE ONLY dotacion.empleado ALTER COLUMN id_empleado SET DEFAULT nextval('dotacion.empleado_id_empleado_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 2384106)
-- Name: proveedor id_proveedor; Type: DEFAULT; Schema: dotacion; Owner: Comfe_owner
--

ALTER TABLE ONLY dotacion.proveedor ALTER COLUMN id_proveedor SET DEFAULT nextval('dotacion.proveedor_id_proveedor_seq'::regclass);


--
-- TOC entry 3217 (class 2604 OID 2384091)
-- Name: tallas id_talla; Type: DEFAULT; Schema: dotacion; Owner: Comfe_owner
--

ALTER TABLE ONLY dotacion.tallas ALTER COLUMN id_talla SET DEFAULT nextval('dotacion.tallas_id_talla_seq'::regclass);


--
-- TOC entry 3392 (class 0 OID 2384095)
-- Dependencies: 226
-- Data for Name: cantidad; Type: TABLE DATA; Schema: dotacion; Owner: Comfe_owner
--

COPY dotacion.cantidad (id_cantidad, descripcion, cantidad) FROM stdin;
1	Dotación inicial	1
2	Reposición semestral	2
3	Dotación anual	3
\.


--
-- TOC entry 3388 (class 0 OID 2384079)
-- Dependencies: 222
-- Data for Name: cargo; Type: TABLE DATA; Schema: dotacion; Owner: Comfe_owner
--

COPY dotacion.cargo (id_cargo, nombre_cargo, descripcion) FROM stdin;
1	Auxiliar Administrativo	Apoya procesos administrativos de oficina
2	Técnico en Sistemas	Encargado del soporte y mantenimiento informático
3	Operario	Realiza labores operativas en planta
\.


--
-- TOC entry 3396 (class 0 OID 2449419)
-- Dependencies: 230
-- Data for Name: dotacion_entregada; Type: TABLE DATA; Schema: dotacion; Owner: Comfe_owner
--

COPY dotacion.dotacion_entregada (id_entrega, id_empleado, id_proveedor, id_cantidad, fecha_entrega) FROM stdin;
\.


--
-- TOC entry 3386 (class 0 OID 2384070)
-- Dependencies: 220
-- Data for Name: empleado; Type: TABLE DATA; Schema: dotacion; Owner: Comfe_owner
--

COPY dotacion.empleado (id_empleado, nombre, apellido, documento, fecha_ingreso, id_cargo, id_talla) FROM stdin;
1	Carlos	Pérez	1012345678	2023-01-15	\N	\N
2	María	Gómez	1023456789	2023-03-20	\N	\N
3	Andrés	Suárez	1034567890	2024-02-05	\N	\N
\.


--
-- TOC entry 3394 (class 0 OID 2384103)
-- Dependencies: 228
-- Data for Name: proveedor; Type: TABLE DATA; Schema: dotacion; Owner: Comfe_owner
--

COPY dotacion.proveedor (id_proveedor, nombre, contacto, telefono, direccion) FROM stdin;
1	Industrias Textiles S.A.S.	Laura Martínez	3001234567	Calle 45 # 12-34, Bucaramanga
2	Calzado Andino	Pedro Rodríguez	3109876543	Carrera 10 # 20-55, Bogotá
3	Uniformes del Oriente	Sandra López	3205678901	Avenida Principal # 100-50, Bucaramanga
\.


--
-- TOC entry 3390 (class 0 OID 2384088)
-- Dependencies: 224
-- Data for Name: tallas; Type: TABLE DATA; Schema: dotacion; Owner: Comfe_owner
--

COPY dotacion.tallas (id_talla, tipo_prenda, talla) FROM stdin;
1	Camisa	S
2	Camisa	M
3	Pantalón	32
4	Pantalón	34
5	Zapatos	40
6	Zapatos	42
\.


--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 225
-- Name: cantidad_id_cantidad_seq; Type: SEQUENCE SET; Schema: dotacion; Owner: Comfe_owner
--

SELECT pg_catalog.setval('dotacion.cantidad_id_cantidad_seq', 3, true);


--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 221
-- Name: cargo_id_cargo_seq; Type: SEQUENCE SET; Schema: dotacion; Owner: Comfe_owner
--

SELECT pg_catalog.setval('dotacion.cargo_id_cargo_seq', 3, true);


--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 229
-- Name: dotacion_entregada_id_entrega_seq; Type: SEQUENCE SET; Schema: dotacion; Owner: Comfe_owner
--

SELECT pg_catalog.setval('dotacion.dotacion_entregada_id_entrega_seq', 1, false);


--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 219
-- Name: empleado_id_empleado_seq; Type: SEQUENCE SET; Schema: dotacion; Owner: Comfe_owner
--

SELECT pg_catalog.setval('dotacion.empleado_id_empleado_seq', 3, true);


--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 227
-- Name: proveedor_id_proveedor_seq; Type: SEQUENCE SET; Schema: dotacion; Owner: Comfe_owner
--

SELECT pg_catalog.setval('dotacion.proveedor_id_proveedor_seq', 3, true);


--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 223
-- Name: tallas_id_talla_seq; Type: SEQUENCE SET; Schema: dotacion; Owner: Comfe_owner
--

SELECT pg_catalog.setval('dotacion.tallas_id_talla_seq', 6, true);


--
-- TOC entry 3232 (class 2606 OID 2384101)
-- Name: cantidad cantidad_pkey; Type: CONSTRAINT; Schema: dotacion; Owner: Comfe_owner
--

ALTER TABLE ONLY dotacion.cantidad
    ADD CONSTRAINT cantidad_pkey PRIMARY KEY (id_cantidad);


--
-- TOC entry 3228 (class 2606 OID 2384086)
-- Name: cargo cargo_pkey; Type: CONSTRAINT; Schema: dotacion; Owner: Comfe_owner
--

ALTER TABLE ONLY dotacion.cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (id_cargo);


--
-- TOC entry 3236 (class 2606 OID 2449425)
-- Name: dotacion_entregada dotacion_entregada_pkey; Type: CONSTRAINT; Schema: dotacion; Owner: Comfe_owner
--

ALTER TABLE ONLY dotacion.dotacion_entregada
    ADD CONSTRAINT dotacion_entregada_pkey PRIMARY KEY (id_entrega);


--
-- TOC entry 3224 (class 2606 OID 2384077)
-- Name: empleado empleado_documento_key; Type: CONSTRAINT; Schema: dotacion; Owner: Comfe_owner
--

ALTER TABLE ONLY dotacion.empleado
    ADD CONSTRAINT empleado_documento_key UNIQUE (documento);


--
-- TOC entry 3226 (class 2606 OID 2384075)
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: dotacion; Owner: Comfe_owner
--

ALTER TABLE ONLY dotacion.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id_empleado);


--
-- TOC entry 3234 (class 2606 OID 2384108)
-- Name: proveedor proveedor_pkey; Type: CONSTRAINT; Schema: dotacion; Owner: Comfe_owner
--

ALTER TABLE ONLY dotacion.proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (id_proveedor);


--
-- TOC entry 3230 (class 2606 OID 2384093)
-- Name: tallas tallas_pkey; Type: CONSTRAINT; Schema: dotacion; Owner: Comfe_owner
--

ALTER TABLE ONLY dotacion.tallas
    ADD CONSTRAINT tallas_pkey PRIMARY KEY (id_talla);


--
-- TOC entry 3237 (class 2606 OID 2449408)
-- Name: empleado fk_empleado_cargo; Type: FK CONSTRAINT; Schema: dotacion; Owner: Comfe_owner
--

ALTER TABLE ONLY dotacion.empleado
    ADD CONSTRAINT fk_empleado_cargo FOREIGN KEY (id_cargo) REFERENCES dotacion.cargo(id_cargo);


--
-- TOC entry 3238 (class 2606 OID 2449413)
-- Name: empleado fk_empleado_talla; Type: FK CONSTRAINT; Schema: dotacion; Owner: Comfe_owner
--

ALTER TABLE ONLY dotacion.empleado
    ADD CONSTRAINT fk_empleado_talla FOREIGN KEY (id_talla) REFERENCES dotacion.tallas(id_talla);


--
-- TOC entry 3239 (class 2606 OID 2449436)
-- Name: dotacion_entregada fk_entrega_cantidad; Type: FK CONSTRAINT; Schema: dotacion; Owner: Comfe_owner
--

ALTER TABLE ONLY dotacion.dotacion_entregada
    ADD CONSTRAINT fk_entrega_cantidad FOREIGN KEY (id_cantidad) REFERENCES dotacion.cantidad(id_cantidad);


--
-- TOC entry 3240 (class 2606 OID 2449426)
-- Name: dotacion_entregada fk_entrega_empleado; Type: FK CONSTRAINT; Schema: dotacion; Owner: Comfe_owner
--

ALTER TABLE ONLY dotacion.dotacion_entregada
    ADD CONSTRAINT fk_entrega_empleado FOREIGN KEY (id_empleado) REFERENCES dotacion.empleado(id_empleado);


--
-- TOC entry 3241 (class 2606 OID 2449431)
-- Name: dotacion_entregada fk_entrega_proveedor; Type: FK CONSTRAINT; Schema: dotacion; Owner: Comfe_owner
--

ALTER TABLE ONLY dotacion.dotacion_entregada
    ADD CONSTRAINT fk_entrega_proveedor FOREIGN KEY (id_proveedor) REFERENCES dotacion.proveedor(id_proveedor);


-- Completed on 2025-08-22 21:30:21

--
-- PostgreSQL database dump complete
--

