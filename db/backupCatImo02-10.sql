PGDMP     -                	    {            CatImo    15.4    15.4 G    <           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            =           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            >           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16398    CatImo    DATABASE        CREATE DATABASE "CatImo" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "CatImo";
                postgres    false            �            1259    16399    arquivos_doc    TABLE     j   CREATE TABLE public.arquivos_doc (
    id_arq integer NOT NULL,
    id_doc integer,
    descricao text
);
     DROP TABLE public.arquivos_doc;
       public         heap    postgres    false            @           0    0    COLUMN arquivos_doc.id_arq    COMMENT     G   COMMENT ON COLUMN public.arquivos_doc.id_arq IS 'pkey, id do arquivo';
          public          postgres    false    214            A           0    0    COLUMN arquivos_doc.id_doc    COMMENT     \   COMMENT ON COLUMN public.arquivos_doc.id_doc IS 'foreign key, puxa o id da tabela doc_ope';
          public          postgres    false    214            B           0    0    COLUMN arquivos_doc.descricao    COMMENT     g   COMMENT ON COLUMN public.arquivos_doc.descricao IS 'armazena o "link" da foto do documento requerido';
          public          postgres    false    214            �            1259    16404    arquivos_doc_id_arq_seq    SEQUENCE     �   CREATE SEQUENCE public.arquivos_doc_id_arq_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.arquivos_doc_id_arq_seq;
       public          postgres    false    214            C           0    0    arquivos_doc_id_arq_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.arquivos_doc_id_arq_seq OWNED BY public.arquivos_doc.id_arq;
          public          postgres    false    215            �            1259    16405    cidades    TABLE     s   CREATE TABLE public.cidades (
    id_cidade integer NOT NULL,
    nome text,
    uf_estado character varying(3)
);
    DROP TABLE public.cidades;
       public         heap    postgres    false            �            1259    16410    cidades_id_cidade_seq    SEQUENCE     �   CREATE SEQUENCE public.cidades_id_cidade_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.cidades_id_cidade_seq;
       public          postgres    false    216            D           0    0    cidades_id_cidade_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.cidades_id_cidade_seq OWNED BY public.cidades.id_cidade;
          public          postgres    false    217            �            1259    16411    doc_ope    TABLE     i   CREATE TABLE public.doc_ope (
    id_doc integer NOT NULL,
    tipo_operacao text,
    descricao text
);
    DROP TABLE public.doc_ope;
       public         heap    postgres    false            E           0    0    COLUMN doc_ope.tipo_operacao    COMMENT     p   COMMENT ON COLUMN public.doc_ope.tipo_operacao IS 'possui o mesmo valor que o tipo_operacao na tabela imoveis';
          public          postgres    false    218            F           0    0    COLUMN doc_ope.descricao    COMMENT     _   COMMENT ON COLUMN public.doc_ope.descricao IS 'nome do documento, ex: Carteira de Identidade';
          public          postgres    false    218            �            1259    16416    doc_ope_id_doc_seq    SEQUENCE     �   CREATE SEQUENCE public.doc_ope_id_doc_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.doc_ope_id_doc_seq;
       public          postgres    false    218            G           0    0    doc_ope_id_doc_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.doc_ope_id_doc_seq OWNED BY public.doc_ope.id_doc;
          public          postgres    false    219            �            1259    16417    especificacoes    TABLE     �   CREATE TABLE public.especificacoes (
    id_espec integer NOT NULL,
    id_imovel integer,
    descricao character varying(20),
    medida character varying(15),
    quantidade integer
);
 "   DROP TABLE public.especificacoes;
       public         heap    postgres    false            H           0    0    COLUMN especificacoes.descricao    COMMENT     F   COMMENT ON COLUMN public.especificacoes.descricao IS 'banheiro, etc';
          public          postgres    false    220            �            1259    16420    especificacoes_id_espec_seq    SEQUENCE     �   CREATE SEQUENCE public.especificacoes_id_espec_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.especificacoes_id_espec_seq;
       public          postgres    false    220            I           0    0    especificacoes_id_espec_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.especificacoes_id_espec_seq OWNED BY public.especificacoes.id_espec;
          public          postgres    false    221            �            1259    16421    fotos_espec    TABLE     l   CREATE TABLE public.fotos_espec (
    id_foto integer NOT NULL,
    id_espec integer,
    descricao text
);
    DROP TABLE public.fotos_espec;
       public         heap    postgres    false            J           0    0    COLUMN fotos_espec.id_espec    COMMENT     R   COMMENT ON COLUMN public.fotos_espec.id_espec IS 'foreign key de especificacoes';
          public          postgres    false    222            K           0    0    COLUMN fotos_espec.descricao    COMMENT     D   COMMENT ON COLUMN public.fotos_espec.descricao IS '"link" da foto';
          public          postgres    false    222            �            1259    16426    fotos_espec_id_foto_seq    SEQUENCE     �   CREATE SEQUENCE public.fotos_espec_id_foto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.fotos_espec_id_foto_seq;
       public          postgres    false    222            L           0    0    fotos_espec_id_foto_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.fotos_espec_id_foto_seq OWNED BY public.fotos_espec.id_foto;
          public          postgres    false    223            �            1259    16427    imoveis    TABLE     �  CREATE TABLE public.imoveis (
    id_imovel integer NOT NULL,
    id_usuario integer,
    tipo_operacao text,
    zona text,
    cidade integer,
    estado character varying(3),
    cep character(11),
    especie text,
    valor numeric,
    bairro character varying(30),
    rua character varying(30),
    numero character varying(6),
    complemento text,
    tamanho_terreno character varying(15),
    tamanho_moradia character varying(15),
    info_complementares character varying(100)
);
    DROP TABLE public.imoveis;
       public         heap    postgres    false            M           0    0    COLUMN imoveis.tipo_operacao    COMMENT     Y   COMMENT ON COLUMN public.imoveis.tipo_operacao IS 'tipo da operação, venda/locação';
          public          postgres    false    224            N           0    0    COLUMN imoveis.zona    COMMENT     A   COMMENT ON COLUMN public.imoveis.zona IS 'zona rural ou urbana';
          public          postgres    false    224            O           0    0    COLUMN imoveis.especie    COMMENT     @   COMMENT ON COLUMN public.imoveis.especie IS 'Apartamento/casa';
          public          postgres    false    224            P           0    0 "   COLUMN imoveis.info_complementares    COMMENT     Z   COMMENT ON COLUMN public.imoveis.info_complementares IS 'campo de especificaçoes extra';
          public          postgres    false    224            �            1259    16432    imoveis_id_imovel_seq    SEQUENCE     �   CREATE SEQUENCE public.imoveis_id_imovel_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.imoveis_id_imovel_seq;
       public          postgres    false    224            Q           0    0    imoveis_id_imovel_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.imoveis_id_imovel_seq OWNED BY public.imoveis.id_imovel;
          public          postgres    false    225            �            1259    16433    usuarios    TABLE     o  CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nome character varying(20),
    sobrenome character varying(30),
    email character varying(50),
    senha character varying(20),
    cpf character(14),
    cidade integer,
    data_nasc date,
    tipo character varying(30),
    rg character(7),
    cep character(8),
    telefone character(11)
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    16436    usuarios_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.usuarios_id_usuario_seq;
       public          postgres    false    226            R           0    0    usuarios_id_usuario_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;
          public          postgres    false    227            �           2604    16437    arquivos_doc id_arq    DEFAULT     z   ALTER TABLE ONLY public.arquivos_doc ALTER COLUMN id_arq SET DEFAULT nextval('public.arquivos_doc_id_arq_seq'::regclass);
 B   ALTER TABLE public.arquivos_doc ALTER COLUMN id_arq DROP DEFAULT;
       public          postgres    false    215    214            �           2604    16438    cidades id_cidade    DEFAULT     v   ALTER TABLE ONLY public.cidades ALTER COLUMN id_cidade SET DEFAULT nextval('public.cidades_id_cidade_seq'::regclass);
 @   ALTER TABLE public.cidades ALTER COLUMN id_cidade DROP DEFAULT;
       public          postgres    false    217    216            �           2604    16439    doc_ope id_doc    DEFAULT     p   ALTER TABLE ONLY public.doc_ope ALTER COLUMN id_doc SET DEFAULT nextval('public.doc_ope_id_doc_seq'::regclass);
 =   ALTER TABLE public.doc_ope ALTER COLUMN id_doc DROP DEFAULT;
       public          postgres    false    219    218            �           2604    16440    especificacoes id_espec    DEFAULT     �   ALTER TABLE ONLY public.especificacoes ALTER COLUMN id_espec SET DEFAULT nextval('public.especificacoes_id_espec_seq'::regclass);
 F   ALTER TABLE public.especificacoes ALTER COLUMN id_espec DROP DEFAULT;
       public          postgres    false    221    220            �           2604    16441    fotos_espec id_foto    DEFAULT     z   ALTER TABLE ONLY public.fotos_espec ALTER COLUMN id_foto SET DEFAULT nextval('public.fotos_espec_id_foto_seq'::regclass);
 B   ALTER TABLE public.fotos_espec ALTER COLUMN id_foto DROP DEFAULT;
       public          postgres    false    223    222            �           2604    16442    imoveis id_imovel    DEFAULT     v   ALTER TABLE ONLY public.imoveis ALTER COLUMN id_imovel SET DEFAULT nextval('public.imoveis_id_imovel_seq'::regclass);
 @   ALTER TABLE public.imoveis ALTER COLUMN id_imovel DROP DEFAULT;
       public          postgres    false    225    224            �           2604    16443    usuarios id_usuario    DEFAULT     z   ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);
 B   ALTER TABLE public.usuarios ALTER COLUMN id_usuario DROP DEFAULT;
       public          postgres    false    227    226            ,          0    16399    arquivos_doc 
   TABLE DATA           A   COPY public.arquivos_doc (id_arq, id_doc, descricao) FROM stdin;
    public          postgres    false    214   �P       .          0    16405    cidades 
   TABLE DATA           =   COPY public.cidades (id_cidade, nome, uf_estado) FROM stdin;
    public          postgres    false    216   �P       0          0    16411    doc_ope 
   TABLE DATA           C   COPY public.doc_ope (id_doc, tipo_operacao, descricao) FROM stdin;
    public          postgres    false    218   �P       2          0    16417    especificacoes 
   TABLE DATA           \   COPY public.especificacoes (id_espec, id_imovel, descricao, medida, quantidade) FROM stdin;
    public          postgres    false    220   	Q       4          0    16421    fotos_espec 
   TABLE DATA           C   COPY public.fotos_espec (id_foto, id_espec, descricao) FROM stdin;
    public          postgres    false    222   &Q       6          0    16427    imoveis 
   TABLE DATA           �   COPY public.imoveis (id_imovel, id_usuario, tipo_operacao, zona, cidade, estado, cep, especie, valor, bairro, rua, numero, complemento, tamanho_terreno, tamanho_moradia, info_complementares) FROM stdin;
    public          postgres    false    224   CQ       8          0    16433    usuarios 
   TABLE DATA           ~   COPY public.usuarios (id_usuario, nome, sobrenome, email, senha, cpf, cidade, data_nasc, tipo, rg, cep, telefone) FROM stdin;
    public          postgres    false    226   tQ       S           0    0    arquivos_doc_id_arq_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.arquivos_doc_id_arq_seq', 1, false);
          public          postgres    false    215            T           0    0    cidades_id_cidade_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.cidades_id_cidade_seq', 1, false);
          public          postgres    false    217            U           0    0    doc_ope_id_doc_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.doc_ope_id_doc_seq', 1, false);
          public          postgres    false    219            V           0    0    especificacoes_id_espec_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.especificacoes_id_espec_seq', 1, false);
          public          postgres    false    221            W           0    0    fotos_espec_id_foto_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.fotos_espec_id_foto_seq', 1, false);
          public          postgres    false    223            X           0    0    imoveis_id_imovel_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.imoveis_id_imovel_seq', 1, true);
          public          postgres    false    225            Y           0    0    usuarios_id_usuario_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 12, true);
          public          postgres    false    227            �           2606    16445    arquivos_doc arquivos_doc_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.arquivos_doc
    ADD CONSTRAINT arquivos_doc_pkey PRIMARY KEY (id_arq);
 H   ALTER TABLE ONLY public.arquivos_doc DROP CONSTRAINT arquivos_doc_pkey;
       public            postgres    false    214            �           2606    16447    cidades cidades_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.cidades
    ADD CONSTRAINT cidades_pkey PRIMARY KEY (id_cidade);
 >   ALTER TABLE ONLY public.cidades DROP CONSTRAINT cidades_pkey;
       public            postgres    false    216            �           2606    16449    doc_ope doc_ope_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.doc_ope
    ADD CONSTRAINT doc_ope_pkey PRIMARY KEY (id_doc);
 >   ALTER TABLE ONLY public.doc_ope DROP CONSTRAINT doc_ope_pkey;
       public            postgres    false    218            �           2606    16451 "   especificacoes especificacoes_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.especificacoes
    ADD CONSTRAINT especificacoes_pkey PRIMARY KEY (id_espec);
 L   ALTER TABLE ONLY public.especificacoes DROP CONSTRAINT especificacoes_pkey;
       public            postgres    false    220            �           2606    16453    fotos_espec fotos_espec_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.fotos_espec
    ADD CONSTRAINT fotos_espec_pkey PRIMARY KEY (id_foto);
 F   ALTER TABLE ONLY public.fotos_espec DROP CONSTRAINT fotos_espec_pkey;
       public            postgres    false    222            �           2606    16455    imoveis imoveis_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.imoveis
    ADD CONSTRAINT imoveis_pkey PRIMARY KEY (id_imovel);
 >   ALTER TABLE ONLY public.imoveis DROP CONSTRAINT imoveis_pkey;
       public            postgres    false    224            �           2606    16457    usuarios usuarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    226            �           2606    16458 %   arquivos_doc arquivos_doc_id_doc_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.arquivos_doc
    ADD CONSTRAINT arquivos_doc_id_doc_fkey FOREIGN KEY (id_doc) REFERENCES public.doc_ope(id_doc);
 O   ALTER TABLE ONLY public.arquivos_doc DROP CONSTRAINT arquivos_doc_id_doc_fkey;
       public          postgres    false    218    214    3215            �           2606    16463 ,   especificacoes especificacoes_id_imovel_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.especificacoes
    ADD CONSTRAINT especificacoes_id_imovel_fkey FOREIGN KEY (id_imovel) REFERENCES public.imoveis(id_imovel);
 V   ALTER TABLE ONLY public.especificacoes DROP CONSTRAINT especificacoes_id_imovel_fkey;
       public          postgres    false    220    3221    224            �           2606    16468 %   fotos_espec fotos_espec_id_espec_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fotos_espec
    ADD CONSTRAINT fotos_espec_id_espec_fkey FOREIGN KEY (id_espec) REFERENCES public.especificacoes(id_espec);
 O   ALTER TABLE ONLY public.fotos_espec DROP CONSTRAINT fotos_espec_id_espec_fkey;
       public          postgres    false    222    3217    220            �           2606    16473    imoveis imoveis_cidade_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.imoveis
    ADD CONSTRAINT imoveis_cidade_fkey FOREIGN KEY (cidade) REFERENCES public.cidades(id_cidade);
 E   ALTER TABLE ONLY public.imoveis DROP CONSTRAINT imoveis_cidade_fkey;
       public          postgres    false    224    3213    216            �           2606    16478    imoveis imoveis_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.imoveis
    ADD CONSTRAINT imoveis_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);
 I   ALTER TABLE ONLY public.imoveis DROP CONSTRAINT imoveis_id_usuario_fkey;
       public          postgres    false    3223    224    226            �           2606    16483    usuarios usuarios_cidade_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_cidade_fkey FOREIGN KEY (cidade) REFERENCES public.cidades(id_cidade);
 G   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_cidade_fkey;
       public          postgres    false    226    3213    216            ,      x������ � �      .      x������ � �      0      x������ � �      2      x������ � �      4      x������ � �      6   !   x�3�4�,K�KI�,*-J���#��b���� �[�      8   �   x�����0���S�7���Y/z�R�#�ЃO�EH0�X�.]���i9l#������\x+�1.FҤh��R�
�y��5�EgJ+�W%�ɴ�g�r&��E�I�	*m0�/�FMK�^�:�Q�i�g���Jy���~�.:���Q�}�������8�j�)�:f��5�e�m�)��:�3a֛0���[�7��#8��}������iߡ��(62T&
I.>3v>c���ڷ     