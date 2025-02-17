PGDMP     !                
    {            CatImo    15.4    15.4 G    <           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
          public          postgres    false    223            �            1259    16427    imoveis    TABLE       CREATE TABLE public.imoveis (
    id_imovel integer NOT NULL,
    id_usuario integer,
    tipo_operacao text,
    zona text,
    cidade integer,
    estado character varying(255),
    cep character(11),
    especie text,
    valor numeric,
    bairro character varying(30),
    rua character varying(30),
    numero character varying(6),
    complemento text,
    tamanho_terreno character varying(15),
    tamanho_moradia character varying(15),
    info_complementares character varying(100),
    imagens character varying(1000)
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
          public          postgres    false    225            �            1259    16433    usuarios    TABLE     |  CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nome character varying(255),
    sobrenome character varying(255),
    email character varying(255),
    senha character varying(255),
    cpf character varying(255),
    cidade integer,
    data_nasc date,
    tipo character varying(30),
    rg character(8),
    cep character(8),
    telefone character(13)
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
    public          postgres    false    216   Q       0          0    16411    doc_ope 
   TABLE DATA           C   COPY public.doc_ope (id_doc, tipo_operacao, descricao) FROM stdin;
    public          postgres    false    218   �      2          0    16417    especificacoes 
   TABLE DATA           \   COPY public.especificacoes (id_espec, id_imovel, descricao, medida, quantidade) FROM stdin;
    public          postgres    false    220   �      4          0    16421    fotos_espec 
   TABLE DATA           C   COPY public.fotos_espec (id_foto, id_espec, descricao) FROM stdin;
    public          postgres    false    222   	      6          0    16427    imoveis 
   TABLE DATA           �   COPY public.imoveis (id_imovel, id_usuario, tipo_operacao, zona, cidade, estado, cep, especie, valor, bairro, rua, numero, complemento, tamanho_terreno, tamanho_moradia, info_complementares, imagens) FROM stdin;
    public          postgres    false    224   (	      8          0    16433    usuarios 
   TABLE DATA           ~   COPY public.usuarios (id_usuario, nome, sobrenome, email, senha, cpf, cidade, data_nasc, tipo, rg, cep, telefone) FROM stdin;
    public          postgres    false    226   .
      S           0    0    arquivos_doc_id_arq_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.arquivos_doc_id_arq_seq', 1, false);
          public          postgres    false    215            T           0    0    cidades_id_cidade_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.cidades_id_cidade_seq', 1, false);
          public          postgres    false    217            U           0    0    doc_ope_id_doc_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.doc_ope_id_doc_seq', 1, false);
          public          postgres    false    219            V           0    0    especificacoes_id_espec_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.especificacoes_id_espec_seq', 1, false);
          public          postgres    false    221            W           0    0    fotos_espec_id_foto_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.fotos_espec_id_foto_seq', 1, false);
          public          postgres    false    223            X           0    0    imoveis_id_imovel_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.imoveis_id_imovel_seq', 11, true);
          public          postgres    false    225            Y           0    0    usuarios_id_usuario_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 62, true);
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
       public          postgres    false    214    3215    218            �           2606    16463 ,   especificacoes especificacoes_id_imovel_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.especificacoes
    ADD CONSTRAINT especificacoes_id_imovel_fkey FOREIGN KEY (id_imovel) REFERENCES public.imoveis(id_imovel);
 V   ALTER TABLE ONLY public.especificacoes DROP CONSTRAINT especificacoes_id_imovel_fkey;
       public          postgres    false    3221    224    220            �           2606    16468 %   fotos_espec fotos_espec_id_espec_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fotos_espec
    ADD CONSTRAINT fotos_espec_id_espec_fkey FOREIGN KEY (id_espec) REFERENCES public.especificacoes(id_espec);
 O   ALTER TABLE ONLY public.fotos_espec DROP CONSTRAINT fotos_espec_id_espec_fkey;
       public          postgres    false    222    220    3217            �           2606    16473    imoveis imoveis_cidade_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.imoveis
    ADD CONSTRAINT imoveis_cidade_fkey FOREIGN KEY (cidade) REFERENCES public.cidades(id_cidade);
 E   ALTER TABLE ONLY public.imoveis DROP CONSTRAINT imoveis_cidade_fkey;
       public          postgres    false    3213    224    216            �           2606    16478    imoveis imoveis_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.imoveis
    ADD CONSTRAINT imoveis_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);
 I   ALTER TABLE ONLY public.imoveis DROP CONSTRAINT imoveis_id_usuario_fkey;
       public          postgres    false    224    3223    226            �           2606    16483    usuarios usuarios_cidade_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_cidade_fkey FOREIGN KEY (cidade) REFERENCES public.cidades(id_cidade);
 G   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_cidade_fkey;
       public          postgres    false    226    216    3213            ,      x������ � �      .      x�t��r�J�-:��
�@�1�ΡD=6u�-�^]�30�����B&�*�����~������h��l�3����<�#��)k�j-�@����}y^^\,.ʳg�v����=�p�?rA��B�a�e0$��Ϟ�M��������p�n�o���^^,\ԝ��w��?�(-/��s{�������bv��?��n=�p�%�����ٳM��_�k.�}��p~ݎ�a������m?dq����<<��6�]�X��7���٦�;��L�i������-2��������0v���E�y	��v��]�|b�<�e;޷��..����~�y����'sQ���دZ}���}�!�p�|l���vGsQE9o���L.�X�}볝ɂ8{�k���4�v�]Ǖ�ɵ޵��ֱc�}����f���}����6+1h�k�����Fj���]w8�Sd5ƹ����R^��>�Kր����Lsa�t\K�W�C�޶X����`~�G�m|�|�'��zr�nl���"�.��ߧ������H)�&��/��{�Ŗx�ke%T�AǮ�Z�y�~�P��� ��7xw�q��#Z���ӷ���/��a����߲,Ky���oR,� �����d�4�_6q΋���o�(0�{�m�n����e��ÐJ���]���y+7>�e����m���Z4�Dyl�֖k����\>Y���h����lwv��Ho��C��J�ޕI�sT�>Ο���+�rp�2�_���[eq��>N㽍Qt�%�џ��8�q���+k�~��.�� 3���R����_Qf���L���Z`�ݭ��ɿ�*� ;�N�����9؍�v�������r	���l�U��7�ʀ���1��
�+��Z���Ij<�О�<�;Y��b�>L��/qX���UK���K�Z����q�V/�(���Mw�d?���������z���+>L��p��^�[�����l��K��ن�]=��/�.�t�����F�ă���������#�*<����ߴ�|ؾ��*���]�Jy�c��d_���qX�q��~�%��8]�ȇ#4��jx��1~�M���?����2���V�b�?hS�c@�=��o���R@y�}��J�y)�� ���wj�H�e�ȫ�l�t�}�Y��mtkS)@�k��\p���/p�q���qG�ʂ��fe�s��w˂����eQb�۽�K���aw���D�_�#��8�M����>��e#/H�9Q��X�'�|p^ �}3Ț��}�˥��K(�dy.�eM0�A>����ߖ��m����p��(1Ђ�A�eK�8� ��'v�I
N���w�mM-�|��o���8���������|�Q�j�݆�����٭�Jh�K��ds������T��y|�ñw�k�Xp�Gl��r��?ʔ�jZ,�//�D��d��6��Fޤ=�|�q��Z@1R����;�)�˚hww�I�ek�o�f�5�tAeK=��Y@#^n�m��2`�XL��@)
���b�9%w9��0��Ƞ��[dPr����f�"�^�кa�Ƞ׀��l��L�E�&�Il���	���r8lO~��\SP�t��O�C�]���_}9���O�?��9��8=P�H-& ևaTb�"���-r����E���;�`�����\/�v�ő�Nh\u��;���E/�fJ�A}�b���/
h��<���bH����l/���ēY�f/d��C+��^�.���(��^��,���Ŵ�f��KY{��i t���zH� M�R�V��v:#��=����^ʊx�ӿq8��&1��b��j�z��/��5���p&�؊�Ӟ�@	���|Y�ȫ���\4ՙX��ˎ7�3��n`�m��e�뮬�-�Erߞ��F�;��2���T��3#�T��%�(�1��Ry9�6�x��R��N�q	�UK�!8��`���#���2�N���7 I\�%�W��`}n�/�����%����}���'I�g��+�j#���#T�(q�xԝ��(_����?I��qȮ5���*8�������?�
�k�Lz("���ۮ�g�N5@����rN�k���}���]|�F��עt4N���d��vb�nd�l��Q��|��D-��0_o��s��,���_	�������/��x�G��'��Q�T0^�Q0�p5\G 0�\=�p��lY7:>��~����R$GWM���3����:PA��l
���~'��הa��x���ۻ�h�0���.���6q�h� ^���'3���|==�(cQ���/ݸ�N�<�e@j�X�l<��oW�Jvy����Ɛ��� n�.��+W؁~�(��mǼD�H:�K���,:��`ѥX,0����5 A��no+L�E��kb���奸��h�����[�o�Rd���F���ݏA���ð9��E����3�V�ڭ����,7<&�4�d���L^��N��'��XFxa{���3�	%Cg��C���s���(�3�c���-�Ԯ���eMv��y��[������k���>6�/�ao�1��*�Z��I��� ~wA�~(�F@�_����r�AG	��VF�DӲ�rY�qfTq_0Y�C�GU�����gU���8}_Y�g��]��?��}�t��/���n��}��O����3}�$`��>E!ey�Oq��_���3�+��C��c?{�y×�^��˲wW\p\S2���q��)��<o�[���~���x��yk{]V@��5oV@��!+�n��^N|��\�1�:Y����V��:oD��:��`2<!p:B|jf�dPD�;��2����7{#5	�f%��7C{�kp����ߋ���bV�+{3�����۪wbUo�܈'w����Y6�L���������f�:�9��	F�1Q�/�\�=�]���r��/)`H�P���Ӄ��ߍqR��y�w��lS���/�/^(Z��ɼ�V�'�b��� z*�� 2ڭ�)U��}8����N$����<�1�9}>����M�1F�ŢW+�؂�{�'�_��`U��!|�bP�A{1R�{'o�i�Q����bT���v�U�X�cE��4��Gտ��߶T��iD��e���-�枉k1�qV�q��j�zU�a�c�i�?e��x���ͮ�C�!��=�x��uz����0,�\��:ࣆ�х7�,{�|*�%�Bt�m{7ĐwV!��s�ML��^!��Ǚ�c�0Ƹ�}#����_���`S��2��дm���M��~��;��AX� b//�''�/��Y��爽��15l�%�[A���}�8k��
� ��s�y��W���ʹ�>byc!��7���Ar(�m�}q^���u3���_�<��{��GiQ�>��e)ȓ����&�vx<�x�A�x��>��{S���F$}�z\a��(c����Aay����O�`X���`P/���%0g��\�*^��/��0�u���f��U�2�kx���ΗQ�h�wH'4�J��j�U�%#�bV0����(,��V�� ,.��!�i�^,���[�d��)^��6�C�����Q^�L��:B)��5����Z�xig'�F!��٥���ɝsF8�3�c�;\��	B���+��8�7Y��&_�]�X��$f�@�����Ǳ��%C���\TF�+Y%[�-<��Q�#�x��>W��备e�8�pEd���H�8{��V��
���&�B~1�W�r���<�a:#�+3u�|C/wǱ��7��z�r��U��/��@��0�����(�#�����A���F�؍ǨXK�~�Ҹ]���|5ȭ'����HJO��;ūQ>�i�������w!Ģ����}2���qط����M6�fY",��=�[S bү�{��D��?�*�_�0�/7mTx�ԯa���r���??�(��B%�>��*-VLKE�'Ad>sUUf��޺�����;]�꼪K�Z��F+uz[j�AC�jD��B�J��q�����le���k    ���d�8���l��F�Z���C��o�vQ�����5�U����'�V]5��d#�k��S:�u-��z�ɚ�aV\!�@I'����^}/��l}7t�|-4u��˲�G�����|ʛ"���}��P�7ޥ��8�;�hE7�v�K��颭��b⒊:kp�&7�����1��k��	�xm,��؍��/����v�o6�����������߈���^�|+oi\��!v�
�aY��M�aC:��P�j�F���D,+ڭbo�_?�2\SK��o�[q��?���c����nE����^�C�����-�)���mU�:�S� ��}�\~|z�rH���>�8��%P���7Q\��q叇s�&>�~:����f�c܊����~%��uK*�{�-s�n��n�<�u����u��ܜHt�H_G��k����R�DS؇#��_=���g0����� ��F<�q�p\\��WӶ噁ʠ�mﻻpF�(��v���8�[������!�G,:�;���<��P�0����!:8H��ލ����`�������V�󽀆7�d#�������M]��D,�2 Ɠ!�n:�SGؖ�݈��d�a�돶�⤺lo��̗�_��E�ɜ޴!��#����������`��)�䰏Wc����w	6��ηy/��0���lb� 1!���Mw<�����9ӣǇh��Ȼ$���$��{ƍ�[�2G�f�T���1�����Q�.sl&7!��A����xc8,71]Ƶ����}��1ۋ��v��[8:��&K�Z>U`��K��x96�j��.~��A�>�l+�U��#�r&����dxn٬W���	Q�����).��6��rϯ��_��������L,�s�P����D��0ܡ��"�����KT��&�<�޹����F�f���(��q����p�Sp�_T�-��>�׋'�y4g�e����D�m7_�%�a�M�w/��*�1}`D�>pq~�yr�e�� FI\%�f�-~�Q[��J��U��q�TS�=��o�T>�T��IY�� �(+�!y"j�S��A>�C|�j���ۻ�/��́g�V7��-�����"����4�P��r4M����ò�4E�v�N��#SI2��w<ޯB����⽋���D~��M����"�"ū�R�Sڲ1�"w(˓K�5]!�5'7GT+[�m��*�[ڑ��6sj]�Ң# u*��p�/x;�8�t���M��i}��o��%7|���kd�m�T�$���L�]srSD�bS}7+�Z��-����m��j��>�����Y}蒿D=�gԈa}�:�o����t�[ 1�䝅JC��� �>�Oq�D0Q){աv�A����i劲A��#R%~�H�8"J_��v� ��Q�ʃF���c���O�A,H��8���ZĜT /A����,�)�
�������Q6}�v�S�6 ���F��eOE� ҧq�wH֚@ѕ���D�.,�>��]��17��#b*2��#�A.���&�� �a	8�������=�S�w_�K�Q�[�y���8q�[��}d>T��[}��8|�[����	<�.[��^�S� o��%(Tp>����4�0��q���'�p9�OY��-���o�oQ$�W�ˀ��J���!�}��p!�N�����p;Mz�j�	o'�����$��;���5�(��?�x�YÆ;����悾�*M�ht�V�ό��~ު[��~eN/��S=���Q�������	��L�kX�~���te�kz����4�Z8�~�� 6l?xBi�,����3�X^��`u(�������eƧO�Ȳe�'��ٲ�S�̐%,��Nlߝ'�eK�ײ%"��������-`C�&p"�}-.�O�vP�ËF�S��`a�u
�/�q�����a�D���zxh����������1ƭai�����W�d"%�3���i�g~��pRO"�rAa63�ׇ
����z�(�5�=օ�FG�|1{'_dJ��Y�J��=~s���$�������������=L�G���A�y@B�Pp=�2t���m�4*�@K'�ihd��1�+�3��e��L��T��3�=�5IC�3(�_���j4����03NR��a�����I� ��S͛g�����k�OA��*�F�A�1T�Y���K��VA��p��ߵO�D^5&OKr(�ݙpx���0�
O��s�Kř~�f&�x!"$Ϸ���_;׿y�[X�����煅���Nr�?BL�٢�I�H%б�N'#��}'�=~~9������lr(�w���e>��
h�w�uk�#E�Cߍ}�#I@�pbQ^���)�����Ȇ@�C�E�I<��J��������84�iL���2�s�+KEc~k^0!��Z�˧����jB͌F�ƧKi���%�RW�ؗ���1!P"[A,��˒�4�� 3����Ӱ8��14�)�0��Ds�Ȳ	�����h�-8bx��ITG�t+�q��,��
�5�zCr>�qV,�>}���L̑��P�|�i�$�� �<�6��#|��^!"g�Z�|�S'�cy�0·Ff��y�d�o=��[�D
��)�.4Q7�C�S�^�'뢆o�.��a�3y�����̔��/|��硺�D%�lL���X8u��W�������{�w���ӽ�7�8���7��]�:�dGi�\�˶��Lb�
���j��F�,����82�'�
��C���*�{�`��y�ywR3	Q}��ݝ�u��PF*f<l������GX�-̚i7E��,gi���ƨ�HK_�~��o�?(X�^�p�n�Q�p�n�Ͱ�!wedw��M�t��763�5m#H�ޫ��K�,�E_�˩��}R�P0�F��[��~�m����<&�J�����h^�l@ �>���/w���9e�������㙑��F���$RN�TFe!(�TjQ�r�Dw�
&
&�qZ�=�`�`"�R�æ�LN�6��pp�`��_�v�S��AA<�`��_Yio�i�ml�,����	Y��N�����"Oi���Q�LL{/
��?���`����O���Y&}�|4��8Q�ʀ��b�����o���F�o��0�N�Tf�%�p�����&c�O|7L����:bNX��g�+�ia�(���eQ�*X���Lv8��b����K,�/�6��
5<88�[��� �r���� ꓝ�Af��ل��$�Ν��o���n<�C1�1x2��I�ӵ�O�♯:�6&U�Ӯ>���Ο��Y�]�~fV}�9�s�����I��`f%��bJ��Nc�Y�T�C��1~��`���z������]Ǆ%�,�}�(Wf.�qĳu*���$�\�ч���΂9LႤ��`�R8��<����NF`a�Tu�=�}���@�E�����/N��m���M?���k��˨��oU���.���E��UV�G���i�*��6\]Pxd��k���?�A+����5~O��By7��x'�:��)��&�iO��-��9t��L{�}��x/(m�vP�xfS���lW�̓�;����we��G����)S�k���d�c����^0S05�𐈿n5���<�Ӌ����؍p�Y<���,��8N����i��]�Ń�䚴 �`�^������&)����`ћ�[���ۋg��ɱ��W1pY0+=�K����N�.�N���&���1 a&`͏�L���eaOΠ��,���%��(�P#ѯK���5��&��89���|������Z���Ə��Y�9];�$�k*�!?ˣ��G���W��&p��d/g���ÌGG.�����p�$J&x�3���B�i-'����p7�Z*�̕>��fe�L��sA8Æ65	�ZɌ��q^��L.���/��E�Cw�(�o%s�NDx���;,�ƥ���������Uثh��ݜƤ��\�4NH���@n/z[��g�H��p��Q�D��a�d    v�C�C4�9qK�T}��"�3D��t(��)R��I����P��Q_�ޒYL���+�ݴ�Ҽ�iL�m�TDᛌizh�ф�yM��F�Q>�Mb���\�����M[�˙yM�=�2��c����e��&E�%�p �Q���J[�ETp�����	�d���Ƿ�ǁ3��J�f��YI�;8&%>şhp.��}r?h܏8�j}Xȃh��T2U�c{�˗�I�))�.�������
Ak~솵��-���vے�C�d��m�LJ��J�����`?ɠ��p��܏,�1It�a�����b�V���m��w���ը���(ÏS?��� {�#�	П�J�!�J�#qH�$����\2��m�|��B(y��6��L�o~�P2������ �p�~:��'�I�df�'+�.����v���U[lw�}�5��"m>�A<P]2�F��,�[2����A�U8�~��p�F3�b��I�Y����4�d6��nl��z�d���S\�����)�J&�h\<N�'gȢb (CZO���4��#"K*�J#���d"Ϳ�̿��!�b��=[�����RaT���������	Bw�P��M�P�iH�dI�w�】+0
�Ԛ�4{1�W�["(�1$C��R}�Wg��w�~�7�P���?�( rA�`"6x��?~me;8�J��Myv��Ѿ���i��<��2u�7�<��&l7}�fQ����gN+bi&�˙�"��4N.�����Q�'��*A����N�*���ڕ�M�o-��ּ�go�gd6m�ɕt�X��P����וJ�8�Fm���jPc�U���u sD�|�H|(��������G�](���/\��7���܉���_�9���9��0	��o�	:F޸��Cz���KN0�!�p�� �7�`��3��_��y
���+�`��*S�/Q4�e�M��f�{��v�X5�bҁ�71MV��<�F	���;�J0�ѹ���E����_31��$Öh��=��Odۉ�N�wC�Aؕ�xj3�2c3:~��;�L�����{F�kX�)~׊�"*����c�;r��Xw�n K��m~kQ{�ױK���<0�"�5��ngc�2 ���y��[1�5�`�㗔���M�
��/e�.��{-���´$��qB<w6�;��_
�g��y�,:tP5��D�����i
�b�=0,�g�[G�iJwÝ�%�c�L kMER-�B�;�5Zt��2O^A<㳟/"=_3�8�������3���摧�׽jҵf�s�Qia.��"Hp�s=��ՐJ��1�Z�a�;���������q4#�@1��~� �qh}2x4�H.���ȃ}ی��i;�`�S�P>	�9�l�P��_�ʧ�,��j���*
=�kan@��:ԧ<y9�Qu(�3��T���<��Y?�� �G���i��� �hZy�����y�xā������#h�����ކ�̈́�wZ�U���w@=���W�oVzuKƌ��xH�I+EA�����t�N}R��rO{�r8�
9A�HÞ��N(�Ӥ�d�||��̓�y�	%�&-fi�~Dr�߱��dg�Q?"�d�x�=O�� R��>����ky�w�s���i&�����1�`F��z��9�?S�%0�Z��]Ÿ�4O?������\\F�"����+kп�����Ͻ���P���Ѹ�Z�J�5���T0��ndAZ�v{ �`~��Q h����%��$���C�m��ʌ0��^�� �
�v�@/�S�vG�v�#�ř�\hd�t�*s�J	vi�+����ߵ�a�yap@I��&2?+FS����f�`���\��D�*�l�J&�F���f��~�v��񇁰!_�������χ�,y����L���hp�n��+�ǐ�d���++;�RK�W�(m���d9���K i~&5�]�Nz��;Z�oā���7y�l���nG�;�⼉�EV7C˜��>>��N6����g�9��#�? �H?�a�I�_ۭ� o�P|���/��e��j&(�q�"_x����t�N�#�F YEي��;�ϒ"^�̍�.��.�w�$������I�E畀$\�S��+����S�FJ�1���E�Y �Zbz�K��*�w�DIE�Dk�߃#U��W���}׏��E��g�]�N2�'�>a�m�i�~�U�	Ѧ6�ئ�Yn�b-?�˗
�cĊD��k�l�����HZ���W��Q�ૐ��61"k`��4�f�ǢFx��G�,�_-�o����f%��N �%<��fﳸ`X��s
��#+�	1Xm�괉��A�oDv�;^�3ڧ0t�Ⱦ�"ǭ"���ɏn*�s�!�Ҡ�1��?'J�f�fdH��$hA���\sA���lO�Cȁ6i�bمu[�27��f�=���^�  ��]�b_0�t�Ah忞_(�d e4R`Lm��T�\[j����0�Į�{h�ˠ�B741P���E�p�{~q%��w#�P��Ӛ/��9�W���,�	Q����=K�h��9�]\눆U��#� 0�#�yq@cS(� Z?��EJY6���I�������.�|.�C!��BS��C ��$��h#�}�wږ��^Ѣdk����R���3�eX�5�l���Z��"���v�X� �����|�q�����pV�h��a��[@%Nss[�f��/�� �Y�6�B�� �e?��ˋG����%�H�a9Cq_��1�4�3���7�yj[VJk��
�j%3��K6�e&&�!K�k����*�����C���ds_)9�TT��v�wL��v�}�~T����X��Y�l`�)����k�CSǂ$0�ZMrt8S�z=�+GM{aX��.��ۆ��8�s7K�~�a� *������X+c۸���b� S�6n.q�ɲ�vɇ^�N�a��8I����WT��,*��,i���P�-T��\h_q�������d={�}���_�ɞV#I������B����,H��Io2�yYZ���C������ͻ)B��
�<�%#ʳ<�.�[�PS�/� <�`Ö��wkU��*و�%�cp����ʂty��vk�p��t*$��(����|�;,s��1�"-8�cw��#-K6�h�O�1+0	���e�0�pĭ<�F�K�����P���e弎o�F5ZlȤ=���~����3��%F��3v�؆�$��&Ƞ_n�I�������J��P����2��f%�����m�f���	b��R� B�>i���L��i�����^=�v��B1�0���� �8B��]��#�J�)�_z���_���V�
Іn�"��N���<#�:�{'�kτc`0�aq�@}�f���[LX���0�]�� Y,�J���u��&տ������]���1Ag�G��U��y I¼�aZ��	2�<���6#����^@C��zS��Pv�}w�W�J�g鈣$���r+��xKV�ٵ伿5b� �� �d�/t�	�BGyd�%`��ox��`������䤷�k�M0�٫;��d�%߽&�R����~N�{�Z���)(�˯[�]2��Ƃ��*R��~߻�)���ɓ����|�\���q��B��?,=%���Ig?vqY�͞���F�@`�2� ��Ut��/D�����r��WRfJP�����\i�z%;4Tj�n���,'�d�~��a���������7[e���[�ؘ=����'��[)w��4n	��F��/�{��������<�K?�J��}�uFUY0���Z��.����U,+��wd�w$&xT#H> ���`Բ��f	��N�P���Q[@�˼L}��\&��$;>��U�}!�p�F8^�c��5i�I_eM>|���uP���%)��yC�{��[j�&މ�5�H$�x�@hb4����I4H���s��U�Ͷ��˰�Y��8�    Mɐ-�
�%!{Ȧ�P�o�҈���#��r��0Ą�a�9�{wH�⒓x��Mn��:n�K�� K~ޖ���+��1#��@�U�JPV�$sK��V� #�1���uju�ِ�Πd��(I�2��J���{����P�r=1����kE���M����W�^j�{��C�i�{�ǣ��/�F-�\f8�_������%��S��0�c�����t'�-�����/J�<�PIO��E�����d���7��L�L<�����}hF�b;hf�g�"O4�?ӃS�O���E�Ք�U�g�Ғ4��@�)H�����n���1�$�K=�RaǕ+�I��w>����A��sC����Z����H:c�� k���8��c����;ۣ� '��؂l��ݤ�?G�#��n��J��i�?��V�����O����b��H��#�ʔJ�[�Qie�k�A�㿢��F:8�A�%y��H�/������4�
T��8}�1	�nD��4�DK����z���!���_����$�J>����b���3�c�gͱ�X�ϝ(�D�pEX"0swm�%��F��@m�1�H��E$9�ߪCby���1��(o��=x�h���hqA:�J=�2��ŉcsv���.Ģ?�r�W��@C�l�}����K����F�,�߰����=�
�0;m�r�D�V�y,❮}r���������c�Z��}���ާ_IA
Z-���$_����DC 
y
P�9�*�aw�}�e��/�;�[�o(�Rue
(�=�VC����/�����o�Y�|�v�����ա��;�α��s���g����ש��>{�$;��zς�K�=�.M*�X�m۸�*����+��>�]}�z�t�+�]zOC���O��ڵJo�n�mcuѤa{kV��z^{�)G*Ej�ҳv�/j�Z�y�� �3Z՘D��êE���,{^�x.�P���s�O�\K��OZ�<�];��~8V߳�I�J/F��_�T^��||��.��z^e�}�M�x��U�Z��]��B֫*n.�Y������ٓl
��ʼkWg� �F�V����� `��4��ir���y"h�ft�T��&U�J.ib�����_�Q�6N�����0��K:��
��Ǌ�`�*�N��
g������Q�a��?aqM��TW�DÝ�5�#i��]S'yp'/u);�I)���t�W'B=0��7q��y��+�
Z��Uܳd�Y*��oPQ�/���5ˣ��CY�V�8-L9��[���gg���U��#�
Ņp��Qf��v|$���䃍y9Vw8K+@zH�o7(CAbHc׺ S��1I1 U����ߞ<\��Nx��O~������-��]RU���!QV˰��:z�`��B1�ZW� ��ԇ�IoC��b2�Ɨ	��ܲ��&� 'w^0�	���ɠ�[����tL`��v�w��\c��=-�"r�v×~>�2�v'3� ׫V��i��*-�[۾6���$f� 욝}jݾ e�em1�^�@2�[ǰ�|��F����O���j������v�O�aC�����.�)	$�����zV~v�O�=¼\��<�Y��3=G�-��;��������a���e5+���C�
b!����v�����$MY.da��������ў��C�q���@lT�f\>(Yچ4� �n�7��79�m�jا�Xxc��	o5 x9���`0^x�Ipf�6c�v�"��#P8��GfjDS<يq?�p;�ڋ�9�#��z��Q�������g�l� �>��#(�Yd�Z����N����؉b;)j�Ā4L����#%����SR�r����eZ������(aJ�*B1V��G����.�����S,�Z��D�VL�iQ�P����L_k27�U�W�ֆ�2��;���4}c&�EC'��Ğ�i���������:;�y�Kx�����!?�y 5S�Bƃa���>��ֱR�v�nC뼉Dqb�)�|���}�!��'<��2l	U��j�<����=�dMv񡴟���˯�	�B��jq�^t��6D����έ��_T�g/�.Nt!V���I�[_�$U"�!}�6�f�C�%4����A��+�L�P�d�������h��mΠ�Rk��7G��v��!v��2[��|N����#���)�G;US$n�Fi�a�_�u����_2�±i�k�W�z���lw
�u�s�\B��j�k��O8�<ڇB��&X��8�t�؀�< mC� j2��&����uP1�?1K�z����'��O�R��6�Xk��dt�y�7_�dp����,��7p��1Oe��]ג�IϘҗBΦp�twLR6lo�|M��Y�'KS�
H��,߾j��鿱�R>Z=�W�l��z�w�"I��fbD? %�|�Gs�=�!��u�'?W�گ[�B1��軨�j;"ؑ��P;&�/���Fin6ֿk��_�)-:c�1�ߍS|��,�o��{�8R׌�?����~�A����D�4z�;��o��p$�C���2I���I�t�|�w��� ���<���"�Z<apn$��q�迉X>��F�l�ؾ�Vq9����K��c�8s��ĉ]D�"�9d(�!Ҏrh������C�� ���R��Xͱ�Q�Ὣ�����_W��E���]��x�d�헸ȵG��h5"�8ͭ��x��f�Z�qJ'{n�.*?��ۥ朶��Iu���C�7Q���f8v �5(_��d��*a=vi�� ��d�խ_�ď �m��0�Qb��[SR�4Nqӹ�1.9t	hMRͱ��񥑪(]����|C�\-��w؃@����X͈x��f�|x�P��Drm��H�P4a�����	
��$(��Z���GۜW�D�k׶y1�e\פ9��H��v.a�P�|�7E�#;�5���>��7U��@ut;m~���������P.��_��*���Ϧm�	�����j��"��� il�\�"����I�n�'@П���c c����m�13�=ِ>��@�$��7�U�dH溇$� ���ڄ��",s�5�	���x���Y���������i-���*�Z���@2N���B��w�,�a���/<o�!�Iʥ��,@CT*� �[}��X�⛞<%���E֩A��ώz���������Uh㍞H�8�3f�#�Y/	"3N� �⋤�{:O,���q�	``��l
ڧ�+$\�l#�!@�m�2�h�� �Td���4�:M��� �5�z��=�U�/�{d�ڌ8�]�}¢��\e,}�$�y�k�b)�\f�[�+�W��/�Ŝ䫢iP����.]��So!`�9n��Ղ� ���:��6��5k���E����Fv���ך.�U�X�\�bY[j��
)	�zJ��*`��e���X����ĥ�E����C=��2��A�Ⱦ���թoᚎ�A暐�4{�rM��=��܇����T�A��)gM���� 3��G��=xU�3�jUM-Y�d�85����O��H���XXmϤV��@i�:��YE3�,��_K��ڽސ2����w�"������v�E�å��7 ���� �ԁ��l�
cE�����<9!��udk���H{7�/�����j�U�b_�v�����F��ڧ¹U��#2�.S~L�C�ը��-�eJO1�f50��j�g��a�Q2BG�%���N�p	[���c,ٯM0y����J6m�Y��G\�6m����Qj϶p�'XI������ݼz����Q�M�2��34/H�F�`�̵3�Z���O;���9����)!|�rռ��_b#Bz�l`%���|H��ncBARYݺ�<�v�g�{u;}��\0\IWh jc��("ߐ��؞�m���
�<�r� �욝9XP�^��մ���<�C��k��djث:�@�?��`�a�C*-����Z�|���_�ߛ�Hf��1cy5K%�탁��������lTҁ UZ;��W�    �g��(������&�R��IAn@��"��7N��vHO��ܮz"�a����5JqOQ<���I�p3��#*�,cf��,l�K<вʂ��޴�/��NK[]�Ŭ����Qb'�&d�߄�� ��e���sz���^�ZҼ�0�HT��y�BL�5;$��EBs���U�U��q&7�/M>eR����9�zT�SUQ(-e��Q��27���L@�T����}�ھʤ<��;� H�����A�o��0��pd�F�G��K��/�{���j��g�63ٷ&\��jC�w+�)7P5��3tz2E`C�W�YPjA	�e[��XDd,8�i�N�O~�E��*��¤_e�b��I�J4��Q�U���O�C�r�J�@�M���Ӹ���O�8N���A�E{�=��E���b[:<�z}�������&u�RTǧg��kr�'tNs8���2/�^�ɟ���U�����8�ӢÓ��>7����C�pg���S�n���Z��yiO�M��%��}�d�^����g��zO�J����_�0+�9���*zІ��t�Ѳ��8��6dμw�.�wO�)�;�-��K�2���[��\,��P<��%��p�6F(�o��ۚ �% �����M[��=���	��sW!�������U�a��al�ӈ te%v����T���V�.C��R�o�6�o��)�Z���� g�8l��@@s=SN��z��w�uq�%
*������|��]h�U��@��`��,�:�I�1+Ȕ<
ԭx��?�O1[A��t�#\x��A^�D����]���Q�?�6_�x�%[?���[3`���V��5zp�T�.�<��-O��R��R���=̚�+�oݹ?Y~8Y"yf|c8�<���u��OZ˞�xm}dڥ�&DV�ɢ�j�C��,AO�3"��	��e�6�}z�%[������A��`>k�S,Ғ����t:Nsm�RZְh�"`Hj�5��(IFq�sr���O��������sk��ۂW��J������JcO&�XZ���m¨ZZz��{p8��sO�|���6�DVZU/^�r����p�b7�'cD��߃�� f�0�Z̸�L��>��Z{�n�ͩ�	]P:
�2,�l����!��roN�+�q��\����my�+�{7�Q��'���Fe_�Q��!�A�wh���:5`����x����sE5����)��5w��	���qr�A9AF��,.:��&g�G4L2`�2��Kw8#J:|�5�v�;�.��U�q2�f�É�$p�}�:wP����:ׂ���D�/���n�9�HQ�zqR���-3jy�yi��^i-�\�{��_:$S���j*BC��^ka�4t�_�����_�Ӳ��,c�C��5����Z��\��y5�O.ZdO
�4�.ɟ��z�3���e�#��[җ�����5�w�I��7A�q9;����&/���=�놌g��Io�ћ�و`��KɆ���pN�{�r*N/��i�˚#�<����z�VZ���~=+�lI$���s�Ȏ*�Č�?Y!��"3�&Z��q�������{�A|ƀ�O4+lL&�w��3#!�6�aQ$@�4sK���l�1?��J�q��F �J;U}��F��)?�S4�2�(~�\��`�4N�V��l�.,O��
N��;$Q��S?#��v��OE�h��m�r��#�?{_:t�,�����g�a��I8م�Ϗ����;�F}L(74g@��i�LP�}��$˟�^�Wg	�ϯ���kXC��r���A��CB��d��#��߆ai"?����|�M=� 6�s���6y�#�մ����yX#�����á��F�. ,la��p �}�QjH�<ut��8�D�UH`�Du��4u'whA^���_ W��c�{�NH�����NXK���mfH�����ɟN�N��<�&SfX�x��9��G��%3��"�	F�����]�Ci��'4گ'o��41T�h^͈+��ͽ?�(̚��];����`֙�����O�%9P7�j!���j�ge�W�~r\��zr翚�E?܍AVh�$��a)��oq�eew�h���ł�D\�AT+Q#��x�1�}�{�� ��a��M
�R+����+�k��{��u>����)_�6�������x �����k�V��W4�01��k�Q��\貏'�VZ��Ox��z(gS�� �TOC��O�XIIuK�@��R��1�,._,y-��,V�F�\B�� "��b�y��n㫻@T+dO�@�c��?�X����N�O'[��B.�/�W�f�ʖ�;PR��Z0�+P?��
�@�u�I����p��˫��]�����A��[dFֺ� B�-I�y6�dY��(|������p�<bu�5 ��ڂt��TY3�
����vA�H/������J�&ީ�g�L;$�j:I�!B-ǀ2z�͵~�$I���)Z�e���]L��%��H �p�!qI\��b*e"�N��QJRum�����Q�����.���K'�B����q/@�x�j1��t9�E"B�íOh�|����(���ܧ�
Cr���p;�D��N4B�t�7�n�S�S�l_yp�Z���N�vd���Mz����)�/d���ܤ�Eecӿ�C�2�j}M�(	Uk=ūm���WB����a�ʮ�݅��`YE��J����7!#jp��`���K雚}p�\T�g�tZ�$��i�!N����c�ܫ���##���N����c��Ϧ�B��G�t�V�&��&X��?C��z�܊���E�a�X�cΉ�� ���Ҩ�`�l7�s�6�B�X�pY�6�8}�A���:�y���:�"��O;E��9�L�|���T+�㏳��6"��}�t@�o�Vqӑe�Js~U�(���yq�f��DRz�0	��{G۵��tR�� �뭕�{!ivd!��9@����~�Ԛ��}(���h�yG����.<ZK0����vueP��A�g0���R3./�G�+��e8�R�C�?W|��}ʁd��L9p�Ê� \��8r���Pi�zƮ�U�0!c�Q�,��80˼тau�	d�/����X&�6�1��{�pN���fY��e���ڕ�����W���~�m,xj���G2���0�3��'}��;�l+\��I��O�C�)	r:�Ϫ@��U��F�������i�R�˷þ�+����Y�v���[�A�aheQF?1�ϲH�=�����IӋ�<�g�-�����-[�_���E�7�KMâ�ec;�+��uR#n��Q����Kq�+������b�`.Fs/ߙp ��%ւG��_P�����$�7I����ޤZb�?�?5�p�ޤɻ?�&O�u{>k!kW���*P�R�碲�����<UF�����i)���2l֙�k�=�-�,vZ��3[g�v�����b6Z��Y�K�]R�~�[+7D�,C$�竱ah�A�h9"]�W�>��f�L8W�l�|���_!{��f��͓Y�`�6��e~��Ο�������eME�z���֐B;�+��a裞�f����Ƶ�ȗE)|��iwn4�
��*@B��|Қ��������M�_2��!ܙ1��|E�����X��U+�B�&�H_s�*���6��o-�:&(&��)�ٙ��S����g�e`�L�*����yν��*�(��n�b���;	hI��3 �'�L&��o8p�د5C ;�x�������5iK�d&�KQ�v����͊�N��UM�3ФUY*t��۪�waU����&o*�Z�����	6�Me�(�x�ML��F.�cp�M�Wk��)2l� ��V�a^�GF�	��H�u�]���p"�Z��`�n�C��6N�����5�h����0��A��v�5ٻ��S��r8��_����y�^����������� ᅤG]�#������&l���;5�(B� �hͦhA�+��    n��6;Л��b���?W_��H,9��^�Y��f3�EV(i2�XZ���R��`Rډ����q��:�*�<���ȔL^�>�,:�:�R� %�U��Gh�c��L��;��d�ϛ��a��)��sވ���bO�']�pn H�Gs���� ��l��L�����b�E���A���˲a1��dA���H��秬��A�|7���m5�6��f�5ML	��yQ	;8�{'��,0�M�B�Cf��$���Ō���ݳM��ya�8Ɓ5��o[э�"��bi�_�-/Y���^WL�K_��b�KC>��o_����<�����x��\b�	��*���{�FTe�4��E�����OX�O��ʪ@���>C�E@瞚�QRۂaώ�.\.C�3��m�n���^���A0�pw��A���wqt(U���ؐ.ٗ{X�8�U��m7?�Q�!�6��@�C�dw8�NPU�M����ٴ6�]��~�69&ME2��!�K��}"��{��ʬɱ�����]�	�K9��@9P4�{���>�5�ye���"a�%m�&ݏ�Ų�<$�+[��`4Ď-e�ޣ���Kc�p�� Ju[9OuR�̞�c,F�;&A!M��?(�Y�p�7��]\5'�\�I�-�k�]�NIi���gM)E����'!���i~����,s�F��\�ҿ���:[����-S�s����	�~�	���9_mt�5�DC�Μ�ս��~�l���ը�ƨQ����,H��*��ށ���i^v��VD�&����c��n`��L�������dgA����0L>a�'�Q���Cd?yo�΂&���ԉ
<u.\�|��0Q%Ȑ��%�:�+�IDOW�����x�U����~��A��續R�;��?(�R��*9V�ҳ-��ޠZ�hG
�6,OM��M��Ee��\�l5,{mL�ƺfũ`~B�v��g��f�2�+�Y�|��8��R\[�����J�����a
(�@�֓�d���GYܹFI�#Ӗ��{�<p���J�<<.�ðJ��$`�U��P\ۓ�usc��=<�(�f%|\���b	�wʭk`Y{�A�d�y1�2m1�<��{!���9���
�ǋnX�3��E����@Jrj�
���z��f�[�O��/7�a��%�Hhxq��81?���$�Ġ���łt"c�Z��M>��]�@��mm��l톕�����Z�R+Bw-:&pze{�{��l������x�6Oc�~R����ho@n��#����|�QZ-~�:lL�V��+����0v�o�!�H1�5���"����>}ܲaI,J[��.-�H��㫬2�d{�[ϖI�����i��;4�S<,%0q~M�[��<0���&`E�2��k�
-Oٕ�˪��m�z���W/�B��n�C�; ���'�� ��Z�W���� X�p�e�t�&�Z��D�1T�9�<�tմ�H��m���9�I��NZb��}�k2������w��x+a�!u����ś�s����M#H��8L���}rFE'��xM1{��j� �����ge�s�N�D��@�׊{�b��^0� �ذK�=�C	�Y��������ie��nD�����e�I��@�瀑����+`�ż�!\T���ߢ�~N�.� �n#����U�����Y����+�nēZ�/j �Ll�'fq���6�n��n����l����
J��Q��u�G�fa�m����7� ���;(����0x�K��>N��ˉ漌��4T����B��^nww
�c�-D[}�yX�"M�S�ҏ�ܜ�f �@��˕�{��$	�C�+K͑�b�ad�,�<p��8���Q�*XG���8n�ϔ	�ͭ]��~w�g㪻��)&�����s��
E
���HS��H����U6�i�d&���2X��
��?��}��Mw�A� ��2ђ�-��m��?o7��Y�a{;�엚~�6�a�j��o�*��r;�@<�v9�3O�eyH5�m�WZ�9l��b˥��<�#�m�ϒ.���f��砢1A�{J�$Lφ�HZ�͛��*g�y'��*K"tb�$��8�䫚�GR������(;�y��a}�+ü��3j� �=��d�d~hP���/H�8^z���17f���f�[i�c&�8���{���J�6qsqr���]M�tXv�w�a��m��-&۾�]	��S����7��n�9�Q���@y��H�����?'w k�<�v����2�9~O�\�c<�]>�":�\K�[���R["��\<�К%�[<�TCq�,D/ 9�T��� �3��k�PH���؃�QU�������$��������/fY'̔OwS���M��C2��1����Ο�Tf��v��Jd��o�mZ�C��Ȑ�c��/ZyIH����8�f��_+N�mK���xh�Z��Y��0p:D@E$/�93Ft�`���%M`@��(9�.����CL�VA�OdU���C�ע��,�`�t������'<i�0�LKv�fs��I��ܵ�$��&� 2J�t�.�^��I{�)�g,���d�G��i�o�Y�ўڧ��j�ĳ��g��0�����@�?�菍�tF�#�1�E�v/��₦%�KlspW���Ks����_Yh�O�>w^j���A�R2j���i��� ؽ�Gʛ�|�L<�F%��B�!|�AZ��%*�:t�	fj��ȯ�o�FV�&[O��MP��Df�:W�j7�Ow���1yT�`� <*�g U���ț���B�%%���s}���,��h��	H���(X���HYż(T��b�3�{�:_%��A=��w��lGƖQV�邏��,}z�Y�����`�-�Ӧ2�@J!������]G�Q0��߭�������"L���Y��Ȋ��ל�Ȃ6��;��w_�7K}�+b!��ڔ)��Fp0eA�Q�6�?pŰ/���L��'�j�x���d�����/{�ݦ�~?!h>}��y��@B�E/ј���9�+�S:���J6�μ��RH�X����U�x�_uC�� g�\�dS�5������A�q�AO��8�M����� ���̶���ve��J<]z��-Y�� j�����x��ڭ��·�o�?�� *>�(^��َ*`5��,��h����_�6�ҥ�,��C�\���,PJVA��`�2�~@d�\��XS��dY(�,^!&�"�s���Jl�[V� ��&ӹ�\�:z������h����ᜤ�i��t�.y�)��BI�5
��Ÿ���}%�K�n�Yd7-�J>F�^,�i��F�1�S�{������(u|�D��LD�M��/���U?{��qخ���ylF.������\n>�0c�?��2��O������5g�?_��k� ��E�w1�����m�1/T>L	M�P
ƗnT���;�Z���!(�x��8Њ�!���������O�Y �v��z�)�ܓ2�P��ۓ��}c��r���+�����;���SJ�˒��>Aq�hYg$�'|�;b1���pX����o{
S�$2f���#��PMʔ�/e亇@�O8��b��,��>��9}a��V�"hj�O�WMEU)4�w���m@�J]r�B)�ψ&|���'�i��mNt���r��G���C}���uZ-v�z��A�2ɣc�Օ�j���@�?]'��9ާʅI�/[����3�S�Z��`84�����/�(��X�^jA�4zp6c��K�S�ژ�iԦ/�O5���t����H=&�13��twCɘ��?n����������Ƙ*���qt�&c�6��4��������J8�29d��=b*�G��KwZ4�/�~�+��s(֗e�Q�.Z0S>QcL�� �n�u�DP+�ia(N�z�	2&u�k��y��|�TE,�"��+���(��Äp���ń�&�Ke�3��    �w�L<�P�pط��p�	���?()�!�N�a)a�ޫQb��u�(�<M��g0��)*!a$6�̺S�df��k�#e�u]�r�^o�'{y��ޠ��M��7Ɵk3Y�IU�Vm�
�}�A�Hu ӀWE�X�%{�?5)@?2�w�jd�p�r�4%3�b�IG��Q�(�ץ���ˤ�@�kPi�+��Ș�l���ڼFt�C�}J�Ԑ�_�3fLE���Rxy���b�Fe�\p�d�9Z��ᳳ_D���/E���O�oD-�x�;��Z"nyu��
-2-P$:aޒY��?�(��61K�0��ڣ�z��l�|�V�&��7���.�p-�G��֓?�v5�	à^�%1��=�����8g�o>�-��6���w����Sc{�E���C_�Vp�֡T0J��le�����i3k�H��W2V�✍��������h�es���iy�o�x��	�#��ʉc�� Jg�M���}���l�|����g�Ȭ������ g����˷��l@�2�FЖ�����_Q�"���6�h�Y�b��J������L��[҈�{�$6Y�6QH���!��\�6�2I��OB9{/�������	�A$���Vò��g�e����8�ѳi`���Q�ޡ�v K�Qa�+�w�����O���u�h���T�3%�$؇Y ������U���a��8uGG2�}���ˮ�W�㶜͍�����0_!Șܡb2��p쵉���Q��q���򃘜튁�?�����*�0���Ĉ� ��Ac�d�ޅ*$�2���&��8�s��YMΎ����ݛ!����y�q�JT�F����bKb$�t�jٓXs^��a���D����*�0~��A�XE�?�lB�f�ޯ��)P���lB�U���n#k��p9��(�\�� m9��s��MW��0�g���>�����dzاX/z��c�����DSW�&��BlbL�QxK������P
����nm'�q��h��Er�5~+�P�6��X�L-�W��2��NS�Ў�`������	�{�ٌM��f'�9�#ɐs�����[:v����͠%������9qh
�1l��b��PٝX[-��m���!v�5rX��RQF�1g_�[Y@�G��oQ��î��Gz!z���궖>�!�L��aw��jy�i�	�dg�w�V� ���o|N�FM�Ov9nW_[T��E���?��9&=8�iӓ�]���_!"�/y��	��U�J�y�r�TL��S� �Jń��_*���_�!I��ɏ��9�!#����!��ݏC9r@+^�2q�邽�X�׮ה�����}�p�^;�$sS���5J��3n@mJ .�LG�A�m'���E}�7?Dg�`�2�Y%�����b�-������������"���pۚ�)���X-H8�[����%�}�7�����.�M�VN:J6.����)��#���]wkm�0(v�����5�%� ԧ��v$���q������k�r|�M��+��M������~�ٙw����塏�=���x�.�8�@�m�`���[;������E�I~<�[��Yl{N
*��$��7j~�z"]��g.�D��=���{�)�2�D����9{�� D��wg� ����`�Y;�����&��\;�{��'7�n�7(���B�x���C�I�/~��~0�z� �N
�Ϛ^�S���lz��ؕ���P��ٯb����@�IhS�.�X�?���M`�5���Z��~5����E�roD
�C!�z�#A�~/m�GL:-��L���X�;Q�V�q���}���(ʅu�@�[E�U�JA��Qe�8���.ϭ�7���l�L��S�:�т]��mڨ���w��(���p�C�6�j���������ܳ��a�,Ђm���4e�ZB��w��-�P����K��5�������/$�BB�I��+?**�������G�I��I��E,�$��I"��JJ�鍟V���~��$���l�&�����ݰu��� ���vO��SƦj7Z:�����i���@;x�X3E��~%''W�A0�;�
�I��x�l�T{�H��i
��dg6·�eC5����Np�z�f��j��O����в`@|˼�����]��F�-�q�W���x�C�S�R�*���ZO@��$�D�RÞ��� �Ǫ�rT�Nj?v}��pe2K�Xۉ�p߾}�ڜ��0#���"t����A�h����i�mf?O��|��+��>��M�uׄ ���FYQ����2���B��T�nYS�5��0��)��F��
�Tn���nWS��	"�h��-׬c2�Ic�%և��÷d`XW��de^R���pF�w�3��F�%qs�J���Z�����\������L��>����m���]�Y(��\[b���[Q��H�M�ج(��SB[	wM�ϏX�'�ӳѸBY�y~E�7J���z[u��ڽ�"�G�1h�ԙa,���*��q�����<�iQ,���*J�����Rq�q��V��a�q���.8�`G�&�&����u�q���q܆[��@ɸ������q�\>O衩���/�{0�<Z)�}�q�� 8uO�.\��r�4:�~,����T���ҀYnAE-9������Ǥb���\���"`�B\Q1���X��H�E�Q�o�����	���9`&���f8����Z�������4���y�n݇���ra$b�Ogg�����=~��|#���ޮð=[�Vv��G�箰���Ò�J�7��`���.�詓���FXW�ωbqG��c�/����he���fիY) �?�{è�����ۊjo��EꬂT{��U�z&9�Zh��;��SQ��zHS�**�iQ�,Ѹ�p���.f��l�r_m���a�Ku��6aK%HY6MwL�T��a���xS����c���*��v=�F?�����ݡ�����.�\`�鰪I�;�e�O�UM����:�Z�v7q����?w����Z�s���k�O��o�W�$i�L����R�Rf���M���&3)ihĸ�7�����E=#��?��h��yq��Ȳ%�8��.��|S�>����+��w3������_�5h����icuUӺ����v5��w�%����$W:�|���7k��8g��wI����O���IM�bV�P�׀��{/��I:k��c�M:k�vZ*)����E��H$��.��6���u��a�ֻ�HF��
{%��0�����9h��k
*�&��^EIU�����i�ƗɍVsU�H����{�&�1V������wj��^+14�LJf��N�<5&n�(�]0<����(�]�yC�t��h-�w��}�Zt�.�趴5*�3�f;����]4��$�(�]4��o��j�d��e�7oW��E�ĘwC�����4K�
^QB~�o���Nκ̋�9�0Z�H�݁��]���y<��Y��y��|�5j���fɍ�k��ȅ�5)�Mk��S��)�w�nB�ڨ2�n���~	�����Փ��71�no������i��uc�������E��*����E��[�����f��SS���|���:��xf��'��/{5w�wi����B,ͨs�v���l8ׂ��n3��9V��2[X��k�ع9M��cu����$, ����ՒS~1n�r��lr�ѷ�sg��6��{PO.��?&�u�d�O��k?��O� &�XP�~�י6���ja~�ݛ�H�������E]$��j�ĘtA�dǟ/b�X-��Y�uQ�.T;�1m�Wժ]4�1IM��z���sg�.�f��8��������h�z4�.��ix�.3�;�GY�����'�����u�[�UDr��n�uI˱�,��?���t��-�qӆF�?o����gU��ҟ��uHYYOΛ$$�Үv}�Y�$q�.��y��P�"��rd,]���]�
���$�n�����Y o�c�]T��mZ�v�h�w)1��ݯ+g�4-��3�H �#��݈���j�4���{�7��W����A�w�QW    C@N�}8UM�*��M�c�
A5� 4��%Y;�$ԋ�C�HZ��a!LA�g˼谜EgS2�>�VQ��*!Rf��l9���v
��Z9�����P�e]�^A������x�G��/.R����5�RS�R���u�Z���l�0U׈��֞Ϧ5v.f���kiV�����dr��n69o��;ɗ�aɐ�i�v�6�� |����&��e�J��!:�1��mu��ܧqsLj`�a�O��#泛Dx��L���o���q��ALħa!�!�ͨ�q/�E�No[��T:���kh��	�M�u���mZxKD�n��~v�R��Et�&��?Ͻ��n7ȤH���Q������p�aɌ��g$���3Zyy��v�z�N�ƆD6�؁�7�U�>�{�b��qlJN�>ǱqîI��5�n����JҐ�5�n��>)O�׭*]����z�͆_<�,@m�۟�U l$���8���C��N�@!���fB|;6Ɛ��!9MY�Nb;{5��Y����	�s0m�O)�9�o�jګ'f��~�W�n諳�zʂQZa��;^�L���z1��.E�}G9^�P��2�@0��{��+����eӆ���mr= �(d���P�xl(nP����k�T/\I����C�i6����f�l�ۣ��b0���6ٚl�ǻ���Y�&�:5>�4㠁�կ#c���&���a۟v݄�pG5#�o#��=Sj?><��uQ+>u5�=��:R���S���(�g%�j.I���jXEMtģ��X�ȡ�7�ОQ/U��趟�!�):n�:�tCRf�-���OG���{������"$x�<��u��}J��p�_*Dyf��!;/_!M2�"�ڙ�A�*ҭ���_6���+���/�r"+��՝��l�e�g`0���?'@�6-�����A�[R/s�G��/��azS$_��x�t����N��k��$��}N�*�r�
�Q��H.RZ���pH)��l�"\R�	^��d�*EH$5�}�P�dܸ贼���������}˛���_���M5��a�I��@�*��s+�P�!L��Y�d��_	V�Y��:��ǳ��:sϬ?8Go:�&�UYzU�7]@��-V���W��Q�U���]��+��G����.��j�35`)c�Q�&<rQFw?|��ge!Zp8�x���@Y���<�4��؟��$xKV��t��'�/����]2���>
�C�M�&���������y�NP�c�T���OS�H�Br�qy�3��|���(\BnZr�%R�1�V�P1�X����ٺ����~��B=0�FM�_�l����Us^���ab1�!��CF�Ƌ�{���ʣW���н�q.�;(9��#��N�[�R,��=��%��Fġ��f��[����>��x��8|Xs`(b�?O�8ETЬ�9��/���l�������	i;��/�����;��;�T�� �:d�E�b&ڳW�j5�f6WX����88X �&<�8�a��4�x�f�R����	3ȱ0d�2mfd|W�^Q�VJuʘT��,f9�6��}���@~�m�zІ֙f����Qݔe/�aҺ���󡹖��ݰ�k�q�=t�L_�P�rzv��M�t����Ȩ��}U=%S���Ş��+��6�[оm;;H��:^���4'�u��� SW�Y�.U��u�ř��p�pL�����r2'oSeO���/��qڈ�����QFT[��q���P�=Mi��dgy!e=��Ѝ�hnʙY�v�g�T��<>#�o�n/�y*��%֮��\�B�ViI�.|��)�iM�F�ہ�5�t��Y��PTb�p4���Z9�[ʙ"�:m�̯n�Tu�)��}3���+"
�i�sbK!�	��a�nX���$Tex%+���ۜ�;����/�Z-RRe��mjN'��(�s�V_��s?� N��	�@{����<�b`���$�,��8Ṹ�9րX�n�52�<��H���ۈ5E���4UԜ1���0o���)���@�O�ӷ@����
D$�H}�J9X��2�	G����4�� hI���?��;4�V$��ّ����R��X-4����!���Z��Oa�V[���ޒ���~�fȚ�ٲ�$�c`�;�\��JE�7���^"�n
�j��/��9dMD��8J�+۴�)Xp���.]�'v
�Lq!aŋݞ7��>nF�(�q������Gli+;��W��Փ�Z��2̳���R��Q,�����}m D��d���lA��hS*3bE'F?�h��������ZR�
*$�jI�gz��V�H��]xm+WJ<Wr6��AEt�4B]��k;]�	�*VB�cxE^�Dl0I,��>��Iٝǝj���/��~:OB{�����`���AJf�K�+％PU�=󻢀��m��^�HA�~3�,mR�R7���6�U�ҝ�+����
"e{d������ν���u���Wf�ZS(�:����?�
Zi�����Bt�h�CPI����+����E��"
�
�'`򢐆z{�^�����E��t��,7f(��uCp�vúGc�����J�º"+C��N��/1�����qg�&H���*�j��p�ج\�J��fJ2�?�ٛ\HCd.PAr�ؗ� ��#6 �iP�D1���A� օ-��&���8���v��;�ŜHG�|7Je�Ҙ[SQn��5�1xt�p�R
�;#3���
R/�	��^hs���`12�%yN	�@D��khU^�Kx-,V������H���Dt;��ZF ��z%���C��6d�t�Yg��������9�H�߂u!���8V�B<�� K%�^�*�<e
���I�[�J+���x]{P�0n���:N~���i7ѱh-5�~/ W����{|� ��_4Cn%�?���իbs)�P�YN:{�P	Ȥ:��fh
�X1�.^I]�$�=.�h9!Rr�Z�s<�J��b+^��.q�!P(Nv��,�⻓���\�L�ۮ�~g���QE�|0 �{����Y�� �^�����@�$����Rbu?XhP`��D�z���鯃�]k�I|#V�cY!�S��{	�Y�%�7湓tU�`5`��W��"!fb9��-x/��@ �r�>̇��Rj���:����/���!>�RKf���^�don�cs&���Y�Pc�zN�ԁ�6RL�:�h��޵����?r�!�t�z%�f�� })!�o�%/��P�%����Z�_�r�UE��ʒ�G4Uu�2��x���zA��Nq�JF�4�)��r�4���9�{^�|]s����Ą��ֳLhG�vArCY<Z:>��v�{��ru�I�m���n�E��ң$����f`<]�yL���LL�7$�VKac�D����N:�/��E�PP,ڰ��KҢʗ-�{��"�ݔ'2{�L }b!��e�O�f2W���Kf����rU,�\w�h_[L0�
��+'X�x����{7��<DͲ��\��0����lD��|�s1*�E6��mCA&>�{���3�f�U�x6Z�De��=��j���:��[7�S�����# �v�a6��u�1�˗l��.��%R�1&�)_����?|��'�jFx���~]2uk�%�j"[+�YFs�[��A��j���E�Q��@R	�Z�d��C�O�2��"�"eW���K�1Hb���̼Ȋ��L�7��"�&�� *)�I��3�ͮ	�y~{LÞb����n���cg��*�{р�6�X"d�j�	�a{��$���g���j�=�?XQ�Ip��ct\�&1�v������ڪ	.����Q��9
�1\*T1��od�M��~E�zz�_a&���S�)����i��$$�ٳ7����uy`V��H�F{x"x�*h�i�ȩ@��BN[aD4��S�Y��t55��x_G���:C羛6xSn�7��;;ş����9)����i����K���D�\Z�]ﾛ��l��.MmTԃmK�M    P���<n�څ"��;I1�ƛ+X!Rz3�@�����.V�kT���g̼�FU��sIm��r��We��4�Ė�b�g��^�Hu��<3T�&��9֬Z}�c����A����#����nq���À�~���K�b"�Ś=ED#K�pR�4��8�:	�zm�٪6�¯���G�*�Ӭ-�sW�߁��`���U-�a͔>[�����V��Z[�+Ð���On�[
�=�sp����裂HrY��`���9V�{�o����>y+
_������T�v��H%�N�.7E�����q�E�~+J\���N��(B6E�����iR�����:&S�Y�G�Z��vnzWj�XˮX��"�5�LmW$.1���"����K}����O�s�񙃏��57X�9�m��x ���~��yl���+%��&���&�qH���1����c�>	��B��84�WM���,�KQ�J�RӣF�$��t��}�;�9Y�����Ӏ�z�®�a��B��^�'mD�EM1OG�y93�+�p׫1L��sQCU�(I�P*���H�ySq�TQ���o��?
����c��W"K�d�di�b�?2����ɜ���MU���c.a2`�zO��@�&B�����My�Ԋ��7 N��HQ'�Njl�0�i��_)�rm�*����������XP�ؘb�A��coX��uƔ(x٫�{3~���j!��?�6L߉��sAُf��'L}��a~�&�J(F6Z���7uRCM%�a�XB(VQ�b��5�@%�IP�I�Vd$`.К���ڑ�������=I��Agb`U���HM��~���ʕ&*��Dҳ�6#|?u�Sӌh�d��#5�h�X��a��a��ޤ{�4�^�w��%�KmE�!]�P�L��aFy�wN�n`x1(��������|��>��0���VR�$�\L�$�P�����aFѲw��C�(Z�.��5t@�x�3J��;v�?����so|-���.��φGT��4�W3J��� \�
�U�B����_���^E�h;N���T�����"�ZY�r��>W�sV ��0��)�H�P�Brx�'~HFa2���R��dB�%�'c�����(K,���R��G�wS����Cqgu\,%�-iW5��۸Y܃;0���c|&���ί���Zvbzw<��[a�5���9�5���}5�06������1+���ޛ�v�Y�.vWv���"c����cQ�4��z
��C׌ɋG=��cz���iE��>@�譐u�~
��%X��	�v;{�(H�~�O��@�n��ϊPf�C�fF�\#v��t�ʨ3f�Ed2����#�+�>'��j!����%�/x%\�#h���"�����Lc����]k�HZ�7*ouW�ܔ�	���ɕjF�1Z�Q(;Fl�nP�t� X��������56t�J�\Q����������PM���X��"��d�x�s7�r�S��@pm#�6r��%Y8����zHx��������z����^�ήY�0���:�
g�r(�r%���+�^�A��Q3���4���+�÷��ن���v��3��ѯ��g�bB����]��|&MXWf0�H��|�o��f��7=]��i��:�]���σO��:2�DuRm��;,�����:Y���Ҟ�f�;��C�g���<5K���킛>~�M�V�iaMl�3%�~�I�gCCm��1�BF)����h��̸�~����+1��l$��p����W�Yk,�.��Y���at���5�C6}h���Z���(�]�%5�L���Ut�
���+G��G8�B�3��m+I���#v@��L��U�Cu8������0/�U��{W�R�8��`��x�#��^�v�X���';_�dkɆ&�$�x�'�%)�(��Jb�9qh)¦ܱ�wE6��J8�b_#�*�6�Y+�k'):~T��](_IbE�����W������;eĈ�Z�����kK�s�	�tf)
�z�R/f�H�z�~�2�"R�"T�����S��:�����6�2�l��)�F��Y�3+&7��ď(�ԛ��!�3�>�q�!��_��Vِܺ�S.�����wN}����YY-��S�/P�8�F"���uX�Φ�jq���q�N���f!���r׽�@+T1�e3Nq�˩)w��Ӷ��ONA9P�"Q��莖|��K�	3�I����"0eEN�9��y�5����ǽCU���/� \�0��뵘�s
��͟��
c��=��S��z�?$G�l}��v���0VE��ŕ0� 5�Sr�֓t�μ��W��<��q�VNE;7�摚2������ݜ�v�a|��)v��<�Oؚ����&^S�j�w�So�$p�5e����.��-K��W�hs�������m��ӫ�f�[�f�x�kOX������U�d!}�8$d���PɎ��m4'�\<�2{��-x^�.�9��.k�^BI�<��]���_����l5�3sJ�I+���%��H`8}z����0T�����:"�`�N2t�Z����Z���==o�]$Fy��4p����]?�G�iW4.N�ؙ9w�F�YdU%�1ڤZ$^�<{վ��Z$g��v�(�0F=]_�����r�l��,·֪�<'g�[4pJ�� �/gBs���_�D���}mΩi)�����]���ШC �V��;��aXށ9� ��%��g$n��[���+!�:/<95u>,`��]M�{��J2 r��I�GN���_��)��P1hi�ډ�����$Ͷ�r�� h�a[`<n�W��I���A����c#��9���ͰaI� �^�_��"X�S�P٥i�7���-M<M�/��mj�6�t:<iCL+�<X�~�vn��ǿ�N~���)���R<ƚS+�=��
R+ј���+M��`��s7�����ͥ�E� r@�C��Â6���7@��_�^LN-�_��~������j�#�?����4AjAL���cR�>,M�)�����������Ϡ��]>_i�����c�%�dv=!�� TtWI�D^ɓ�5Ӽ�|U���b�Uk%OL"f!�G�¯�BHl�zNzٽCU.���54c�(�u�ڱ޺E�)d��Um��X��Sj9��
�bG-�썍@L�Q�����ai�H�'��s7�u��Yx�cId�]H@�W�ڼYE P�5��d`g�sm��'��@I>� ����9^ �m���ױr�Y��i-0_����9�	�I�������:�M�O7�������q���YRʙ�S��$�l�NZH=�.�d�~H�v;��*T1�l��.��$�g�
��,_ZԒ�3i B@�%B�zv#���X��,E쎪|a`^8m�V5|g}��r��<&o5�" M�rR�yK'MB,睟�/�f��T"S S��/��|�1�U�A�ZR^ncCA�$Ga7T�e����Յ@�VI��T�}�*�JMج�"����OOP��ví7���������d@(�l�D��h�uj�o��� +�ՒD`H�
��p��2��[�:T��v�i`�1��	��;pM�����l�!"r4�1£��v�@�[(�'?$��q�o�(m�T�$JS�Rq�[�N֯�ڷ�Q�I�A����X{���*ٴ$��|JjrnX�pG*�_=��۔B�*�ʦ����jjف�e���H�ޱJ*@�p>y6�ԅ���͚���;�*���н:y*����W����Y4����y�x�����>�}�?1�T��֟�ʹ��
���dۂ���w��PɾԐ3�k�+�Жg��;o�7�k,.} ik؆�3EC�B�R�s�ϩmE;�õK�%�^��3����_g�*SA$ø+v�Φ ��#w$���m�����1Q�;ZX��%�*�2�HE���8��X���� ��s:��7������(Pd+��Y�f�n��H��D�PH�����㕭D�}%���2a�o=[UZ3�/i�t    ��X��7�1�?VM
�B����)}�Lt
�2|ֱY&�����d�굹3�e�&��"�v*)�dp����3®m+�&V�>�����T����2�M��6Fl!��������Ge�<���	 ˥Ho�M
�Fo7���Z��%�f�t����͜���8��fk#���
�!>��m*ؽv��ǒ{�^T�L�&�&zX���6�ӼZ�{t�<-��o5��E(�܉�	*���
��{�!�o�Z���I��*%���6XV�a/��$�bY3�̽}z�ˊ��w>;g�W����|8�
�u�ڰ���h���o݄o�ݟ�\i����*3��$K����ė&����Tj��ӘM�	3��L&�Q2A)�ꆽ�w3�oȌp�Â>)?"�,q���6ټ�X�-��K�#�v1��&�i3�ߌ��$N2�Y0O�我ܟ83�=Z)+Ŧ{���=Ș ���2E\jG��. ���~��Sgm�l���`geθYm����j+�^����*-^�G˴��� $J�����a�Y���qf�9���(Ʋ��l.u,tW3	��?&�7����'�GI�X���=(�z�X3�v:�M Xh�P�V0�n���̊����!-�+�,On�[?K��Z��Q�*�O��C����+QhFmuqiR��@Q��/�~"ִɈ�2�odz�&`'f�������J�1� �����ͮ�T���٫)��b���CU��Қ�j�$`2���p.��9[��(�N��.�?�<V�H��c�kL���:8��=��R0�0
˝���x4��X��'�c]V	9���j��iR�m#O���3^���t�*�ujS63VB��}���a��T=aoIX5IF ����)#i��f|���b5�g��D��97]�z7z�����)�Y}�e�|�z�ր0��RD�=Ƀ�c��S�C��L%-ZL��?><�~�rч�%C4ڌ���� ֊��#��*֑����+����m�̭5CW��qid��7�;�Ӱ��Z[��&�`�{?���fA�OJ�T�8ix��(�Η�;���\��ahg��
�W������p�I�yA��X��x�����8�Ӎ|y�h�$���Kg�M0�Z��r!�+���JExE��k89��(��b���9r�W�p�<�W����ao8I��Bu�q�Oϒ(��௒3�۽����MX�Fq������R1/O��׻����ަ����
=y�H<Z͋<�q�@��Mh9����+u��!@�Иϭ�~a�.�`t|%�����7�����GS��h��m�<�h3^B���n�.��uB��������LQVIEKަ���J
Z$wZ08�?La(����ǧ�JM��li"pÐ���i����d��;�w ӐMZ��qY�&=�O�@�T?�˲K�A7��\h~��2�`	6�:�������������D�D9cf���0|~[�}�S���K�5/�'9��K�e�q�]~�U��W?>�k�l��]r�"�ț"�1�Y���My[� i���a6q�.�����i���O���x�RO��\���`߂cU�>�#�pg�k#P�WU��m�r��I�����KB�h��.��#3#᱓ �l�����	���^^tM��SqQ�����u���o�F�ɇ!,G	M�������8�?{;��ʥV4D�W5c�-%ֿ���7�ÓC�����������x��1���B��(
��������M�6�Q�)��e"�L�`m��E��l�4kP�&��-����g^^ۺRe�%K���?��5K��B�JV��#���#�;�}3�`y���M�®Ar���k����C�L-�<�Kk�_X}�e�Gl"D��E��J���$�ێ���9B<I�8q�7�0��(.ping���O�,���=L�'�g��.s�޽s�({�!�u|�d���!�6+t?R�!}z,����w5ۚHǮ�G#Xaщ{��VI��},��L���>V�z���T���NQb��hT3x�f��u�_}��r�7�!E����5�v��O�����X�}�k����{5O@��8젾��=��b)<���kWz�R��]��	�b]>�J���f��Rx�Hyyٕ�[Z����\�8�f��J��30�����Ʈ�;�-����P�^�^k�h�	O��VKu��7��!�Y�0��kMR�1�T�U�0C�n<��2ut"���
rrRd����ڗ*�N�'�K����Dq��3���"��[S�~?]>mP��\O��I{0�d˔�Y|DJ�-n��i�.Ds>gW�2�ݰ���1a	�F=��ɍ���}|v(.�4���Ά���~���Ű�S��X1����^���(Z��	��1�p��Q�Y�Dv�����;*(/l,TWvK;��U�Y����=��!��+Gݣ���P��4x.E�f�� �Vg��?X��k�8�\�	��t���r����32�ݹ#���ł�zX�șP,����w�S6� Iپ������㿾û�����Z":��LLDc�:�N~�"*+P9
����/���n�#Uʔ��o�2�-��"	���E�S�F�[��_D�����Jʿ���B�q�ӧ:����s�	6��d�c��`2���ؒ4��p��I>�$ioǽ ����y��;:�e���Z��m>���mw�g��a��o7���d��/|���%���"(��դ��;FǄ�F��ܖ�Fk&��{�N2���t��Ck��،�;�=%�H���C�pV$�\�۔��Jj�C+r\���q|.����^� x��(/Y�Mh���ik
v{���&�V�w�Z�p����bW�����rIXH)��kZ�pKA&�AH@˸<�1�{������|`����i8�GГ)VZ9u��6��� �K��4{_�z%��[p��0+����%���-��o�TX��������Lkf�����w�dD>��+Y7�W̂X$l���3�x�%�q8D��<�)K['���_&�C�HAx#��/x	$���)��)Xi�RZ4_�,y閟O����J]& �|�e=/�B�o�2�7�=��?>�~;y���.���Oۘ_8s�/�rmi�Ǫ�Z-j�:�̜Ŋ"Ҩ ��bI~Lj�V��)Č.{�#���:�k���m��DU�k5�Ɩ�5����RLRw��Ɋ�:�q�G�d�0u�0��羊�9�~�+T�EP�����먰�rs쾪�[��:������q�GΘ;?�UЎ>�?��뜂ҧx����
�d�,| +�Vm{��OoE�7">�0)NA�k 	N�"ꅄ0��[N0�������ܪ��5ٓl�>8I3<���>|j~4<=&8h���F����ZS5L�>.ԧCի�JTN�g�rO.��I�����ѣ���(w���x��f��[��p�ο;�4Rx��gͺ��eԧ�{$�SÊ�b4`���-M�X�sS�$�O��mFal7���(�m&��cWGmT�>���4#�)��r�{	x��BLX�9�-�2�+P cw��X+��}���o�4+C�;�����o��a����Fp����f:��̰��^47���u��g!q�~�U�;�*1[^�6-��ZV�6��o$s
	�1C�����n?X���<{s
}3�/�k��*g����N\Oj���I*
6��{�B���e�u��C�ifw�;�Ba<�&�]��J��EZ�[�V-�m����u��#i��񖦙�f���Y��آK�c�Rj�����6�7_����������H�����BŅ�xl^d�b+��
QߢH�٫q������0���k+D0\E��dI�Q�X�	�/):�%9�DċK�I=�H�[j�Ը�_�E��O��W�i�&�r%���Q�W̈́K�bTC�[c�N�eF&��m�Il�Jx���G���ei�s����;��)V�Vc�g�3<уQ�c�wSN�wƊ�""�|Y+�K�q�sג`c��-sS]$��U/��ig�L�׍'    �8ֈ��C�d�������)��-_h��+��[�qC�۰��[�5?��X��,ӝ��H�J��)֝����_*��R2e��,�\/(T�J���/�#�@|6+W��_��Q��'R�X�Q*1��w۩�c0�?���[2�e@��9�ȋ�2��T�e�a��X��o��5�`�Y�q�.�l�"aiG�m�DgPY�S���^U�5(��/V����$�!t�%B�,Z��&���e-�tb	k�r웙E��̀���L�"�o�6�|(�W��t����(m��(��ܠ�u�,;�5�,D^�ۅ��d�O�/h��� L�{ne���DfBnRx��M��r���aV쇓��=��M�f}�j��ǽ����}!��#�����~L��d��-߯���ŀxR��o�8�ֈ���a�k�4,�r�	B;q�Eq���H覣��5B�m�����6Z�����/��i t�� a��Ԉ��<�/�4��sc�6q63��d�K��*�@4���Wd�8F��ǰ8>�8�  ����>kP���x��t�z�Ĺ���  %���?��d�ڞz�~�.i��Ī�q��nn�!�:|�i� �W��S����k�
���i�� g�q�6����-�5Ow ��DR�&��.]�k��z��k�OƁv��y��y:��ۮH�Mk:׵�-6�ol9�׭6�ҥk�+3wO⁗St��\I��pn��E���<}d����v��j��)��0�$��E�W�����R�Wʲ�A�7�����/��D,̎��[���n�@	��i�%	���k�ވ@�w9o����Ǐ�E
�۞ފ ���?K�Xxzw>歱��v8�x�)No�u�Nי0y�㧻�&�B�N\C/�,�C>S�c�K-�� �� ���'�.��)'
aGh��_c?F)��X�`���\�`&��
�%� Q�:?�d�LF�5�~��	�0����C��XImʃ7]������,���.k��.9=6U��O�v&���5�ic��s{��NX:�<q4 nӻTW0̬�X�l@p߅o@
[���.|�����* �7�]8�v<��;�����w��RD}�Þq	��x�Pxw�����F��؃��wO[oWKB���1�ˎ��J���:����!�	xc�?n�S
R���=�I�Ӑe�'*�[f��&9�����ۡ<gu�p���Ǒ��(;����!M��r'7��ɵ���3�V��x����6���Z��/%Y�ZT���Ȃ-��C��Hb$4��3����v�����&�t���ň����}Fb�ng�4���h���MV�0������B�w�3�B��&i��`+�l�_���4��A��R֬�Gڝ�Z!��&�n����+4S+��HN��4�\8�e~�0�T�7��Ҕc.P��1�M8�����g)��;6Ϙ�d�>Y͂Rɢm��B��m��A��V�f-�i�dM��䜻����`%����/|�l�E��*^�IkI�/�H%�Jyij�2>��L+�X�z}j_��G�,V6⏚���&D��<xrG_l��9�$�{G2Yg��}��HlEel|�G�|��B/��C��j���)�~B-e7�KN]|ɠ�>��wjc���] �S���U(�V����Z_t,��A���S�:+w��yp)C��i.읷�u�7���zy�A(pf\��=04���ٞ��
�?�aC%����a�+����Dv�2�XM�z%�N�k�Yk�1X��xQ�P������@_���(^�n@�.5�f�k1�u�V��p[>�b�B5w���r��]p!�X�q���\���畒i'n�f��A��b�2�l����3ݱw$of����\D��~;$O䣐�b��OV���Vt����- ��}����V�K�M ��'BXm0u��-�oa&��F��z���,����O_�$��z�q��� e�P���s�I�6��Di�G{��e]:�,(L�֒��Y��f^��eU�d��G�0S"����@�]�������چ�]5q��!鈦Y�X;�:e�6�z��S�9R-��k��m��Q�U�������g(8%n
c�6*?3a�PL�R*�w��S�� 1|�0l�O�M���N�X�g�!}��@p�ϜԪ"��Ӫhlٳ�V���.����J�`�/�h�I(%g�<�c�PGxUG�Jب�����?�ͯH�����BF�c�HAjG��Sx����X���.��^a_�e[R��(�)�����5 �>L��CM(.�@�C��.	h�f�$�,��<�؅z;�'�P�d�>ͤ͔���4o��h��� U�-e])F��Z��}Wi�T�q�%���4�O�ߵ�=[���(㳨1*���sɳ?G��u$�6��a��k�A��]�<�I[�Ab\7yL@�c���<E���m�4iT�yR�U(������C%s����H_�Z�1;��M�q�:1���Pk�,X��w>��_����Z]�MU]l��[a�t��5>[��M�$%�k������J-4�"���kW���b<~�5�x/S��*���ˊ
k�[rج	�5�Ia	bo�'7�
�-�m�8�ݒ����_�}�G,�|Y�0�|8�ޤ����]D�9��Cl˺Z$��^�l�U?�{����f�^�Y���jA�mT<j������f֬\X����s�����mc����1x�>Y��� �J-����D[2F�cY{����)�	�R����:,熥����@�۸x`kO�%�����O�����(����˹��#4K��4u�+��;s]�c�',��nǺ��w�u��S`�ٶn�!����#avR-�V��+�b�1Kk�qe�H~��$	�I��l�Y{��4NT����M�Hާ^(?h^�@掬�
�q��m���P�J�g繾�5`�'���d�]\)D��g$�����~��������a��[�Ѝ�3$P����L=�W�/Dq5~VFO�Pߜ1���J�0��<�o&�H��%Y��X�	��^r��P�������Ȯ.X�XD��ݐ�S�t7�$�PY���
!�3���`���*�5K	o+�vSQ+;����f�PV4q��`��z�=8z.�WS�P���~�p�nP��G����z�lfa�{:ŰF�âX�ǒ �R7WX�b���Ml`�s���ܜ��c�Uv������*��)���M��~P���6� ��]�R$YGwu3m��������;��B����˨��.�]��B�}���/
\
栳?Ɣ� ���/��j�0�'#055LH���
&(A�����2���W��*3�fk���a�#(�����ޡ�d0�����7G5���� \M�Nj�H%�a������}w� 3��5ݺ��w6 ������mW6����o�a@bDX���?�> +�XBa��� a�Q~�g(WjHVEI_Z�ߚ�"�C��w�No1�3��SiS�7C�"�2�b�G0������w�"�C�5L����;q(Z�!M�l�G�����5I�:�6�ם�	���ĵl�HI7���a�z����Nf�遐K�-�V��6÷������u��e����7[��{*%���uܕ&�(g�Kv?~DV���l�R���8��B�TX~��ȉy�e�GȶK��.=�����j5R �S��-��N��Qc�(�9��l��v�F9�Yg��e��"�c�#��L��b�����N~�������uge�'���ßM���"ݼ[\���eG,:o�}���]Vf;O��|�o�>���lm/�z��x�m��K���Ѝ -����X�A�aܢ�%K��f�Z��KX�(�E�T�&x[�#��ũ�z�aJz�
C�0?�2h��"n��O~y-������-h�� ���~m���,z8<] !�_Z���1oD�R����.�d�m�!�;�a��,}�}���n������*a�-L����f�t����!Y�����n�y���� �#V�R�k���|��m0H�<<X�`eԒ�����kA�n5 �(��cX }  �8��&�nٍ��k�˒ۊL��!7$x�!�{�aD��`jHԱ�$o7|�����b��������?AԇE���A�Rp��\}z�6,M��m�	?T�`1Q�⯓A%�~�W�b�P��_q֊ki�ZM�u3	E�)f�OHة!o�c%8��LU���7vV-���'���Ty#��69b4WDL�{{,
3�ْNfl53�Y������av��bY5�5�<q�@-�H<��@Y� �����A" ���ў�-��C����/ �8(r,V-��E�"����%?^x����Y͢S:���@n(�s�f0 WE�Q��n�5&��F�<EK2��SC°�zwP5�U������B����tK�E��?�B�a����������È�#�@2<����?��,K�&؍G�����?��DV���=�F�1�//�������9L-��_%�u��d��6-���dϔ\��ȶ�6}|�:�p�w�	,6f�7�w�W��+T��
�����W6G-kE�{di�0Bo�`[i����jߏ���8�HW�l�P4�����ZE6X��?�z�TR����t��Bg�.��jHˠ���U�×߬A�Q��
fj-�ʜO�u�7��FC_�x���s�{��C|�S��N����8a��9.z'��@�6ȄG�2#�?���0���0�4n���}4h$�n��P�cd� �/�w0�C�� �D���8��Y��Y���s3nY����
�1��v�V '�p)`]!��}�VA*���(�q�O�OH���LE�#(Y�ETE�L����7�HA�^��ݒ�9���X)e����DJf�Jz��aYp|�;�Q����M��f��@����IW��aa�˟7E,����2��G�I�~����o�@�T,�s.�Ƣ�t��T#V6��\���6%7��uK���:��2��H&��ԍxF��x�4?��В�d6[O(PӚݩ�2] R��w�#W+�0B'*�;|������cL�Z��ĕc7��j{��oP�7���{�W�YrA������D�P�����m�g��f@9@0�W��ׁ\����v�I�����-a���(U��A��9��z��W���׊̛)1��HZ���y�A6�).Y\��7îy�g�RP�g �!��:m�<p-�!jH��VSz�3�v:B�K�V4���7��nȼ���b���F3aM���1��e&��x��I�~���l��yb݊�i�����t�$X���xy8�fxN�B��,MQ<��aEy��R܃1���[j&����wҥ���kɻƣ?�!C5R&=� � cX�@�J�O&/p��ڝn:Y`�R�넿w�U"!��Z�4�F̯f#mV���Ϊ^���ʒp�͏]e+MT}�c>�G���y�y��D�0��&�@ʯ��#ǣ��Z'TM{��ג#J7���
�qm1!�L��,�bt͕k�$~5�
�@z�\O?�<N��5'��H|�`mV�.@5�ӯN�ܿp��9=�ð��T��h�R3M�fJm�l�d�Z/�,τ����E�ܗ?u�a<t;�\r`���-o��&1�����on��t��0I����4������a��^��M%,W�ƃc��~�gɼ�P�,_+.�g��n�m�<��啴�-f�Hn�|��l�svѓ�ڲ鮇�DbF�1�.��=�L�Ԟh��Bu��v�L�k�M*K�r�ۋ6�p�0�^�1��4C��e��O.�y6�%��dÚ��1@p��.�qqTP7|��"Ik�}��͸�7
������s����p����^���+���d����H)���~?��0�Q}`��b�K�����z����^���0���?�۟����C'qf      0      x������ � �      2      x������ � �      4      x������ � �      6   �   x���K��0���)z�Q�PJ��[�b�f,,Q��T}p�9�\ll7,� ��Ʃ����:	µl��q��3�H=�<p]6�%�C�=�6,���4�$I���{,+@gnO����0 ���<b��K�oʼ'��ԔeC�HS�`����{�T�e�}�/ް˕HjSl�=�pѺ�,m���%X%��ao.|�w�7S�X��?qO^�h��_VȂ/K��y'�e��L�����WHw������E      8   �  x��VMs�0=�_�c|��VH��i�cә��S.J��[�1�N}W|�m�|�k�A��=i��gF~.s�i�%W�r�UmԚ0�q�Ry�=����5�pg��t����Կ̺�p�l� ٦�65>���4SE�r��-�Y��-6�{d!����N��~�{mw���c�*~U�2��\i�V+3ֹΏ�q!�0BD6:K7�~7���a$��y��ŋ$[.�;\�1:�m=8��@��Rp)#��w7�7߾wSBF�����I��)��x2UN���B#�eѯ�F���Lj�pvE,�R�4d�)�&�lP���2:F��m�����%?T�屾�j�X='��P�LSiԼ�v$�0&f#Z��(0�l����Ii}����7RQE�Ks'�$�ހ�/�����>��?sX�Ϥ�q��1�����)"�!zTO�O�qjc�\���d2���4m}re�����`g ��f4�~�`�/�M��D�ϘK�3�7ۧ�hT�_@ �R�D �L-�e0��rf��s�Ż#��A���A�o����`�{��v��2sAmf���h�����g ��'n��0��e*(c��z~�U�ϭ�#dnٷ�,�!Kkȁ5��rdYPk�����jPX�Aa����jPX�ATą��ё����i���<�����^�]��%Z��r#�������4��q�ܑ�n��2�:Fּ�#+)��J�牸>x���?��     