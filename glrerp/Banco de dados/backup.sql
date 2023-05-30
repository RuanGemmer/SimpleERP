PGDMP     %    $                {            erp    15.1    15.1 3    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    17091    erp    DATABASE     z   CREATE DATABASE erp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE erp;
                postgres    false            �            1259    17240    cliente    TABLE     M  CREATE TABLE public.cliente (
    id integer NOT NULL,
    nome character varying(150) NOT NULL,
    cpf character varying(45) NOT NULL,
    email character varying(150) NOT NULL,
    telefone character varying(45) NOT NULL,
    endereco character varying(250),
    tipo character varying(45) NOT NULL,
    ativo boolean NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    17239    cliente_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cliente_id_seq;
       public          postgres    false    215            9           0    0    cliente_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;
          public          postgres    false    214            �            1259    17275 	   estrutura    TABLE     �   CREATE TABLE public.estrutura (
    item_id integer NOT NULL,
    insumo_id integer NOT NULL,
    qtde_insumo double precision NOT NULL,
    ativo boolean NOT NULL,
    und_medida character varying(45) NOT NULL,
    valor_estrutura numeric(10,2)
);
    DROP TABLE public.estrutura;
       public         heap    postgres    false            �            1259    17256    grupo    TABLE     �   CREATE TABLE public.grupo (
    id integer NOT NULL,
    descricao character varying(100) NOT NULL,
    tipo character varying(45) NOT NULL,
    ativo boolean NOT NULL
);
    DROP TABLE public.grupo;
       public         heap    postgres    false            �            1259    17255    grupo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.grupo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.grupo_id_seq;
       public          postgres    false    219            :           0    0    grupo_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.grupo_id_seq OWNED BY public.grupo.id;
          public          postgres    false    218            �            1259    17263    item    TABLE     �  CREATE TABLE public.item (
    id integer NOT NULL,
    id_grupo integer NOT NULL,
    descricao character varying(150) NOT NULL,
    qtde_estoque double precision NOT NULL,
    ativo boolean NOT NULL,
    unidade_medida character varying(45) NOT NULL,
    observacao text,
    conv1 double precision,
    und_conv1 character varying(45),
    conv2 double precision,
    und_conv2 character varying(45),
    valor numeric(10,2) NOT NULL
);
    DROP TABLE public.item;
       public         heap    postgres    false            �            1259    17262    item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.item_id_seq;
       public          postgres    false    221            ;           0    0    item_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.item_id_seq OWNED BY public.item.id;
          public          postgres    false    220            �            1259    17292    movimentacao    TABLE     u  CREATE TABLE public.movimentacao (
    id integer NOT NULL,
    tipo character varying(45) NOT NULL,
    data timestamp without time zone NOT NULL,
    item_id integer NOT NULL,
    cliente_id integer,
    valor numeric(10,2) NOT NULL,
    qtde double precision NOT NULL,
    perda double precision NOT NULL,
    observacao character varying(500),
    id_pedido integer
);
     DROP TABLE public.movimentacao;
       public         heap    postgres    false            �            1259    17291    movimentacao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movimentacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.movimentacao_id_seq;
       public          postgres    false    224            <           0    0    movimentacao_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.movimentacao_id_seq OWNED BY public.movimentacao.id;
          public          postgres    false    223            �            1259    17310    movimentacao_usuario    TABLE     t   CREATE TABLE public.movimentacao_usuario (
    movimentacao_id integer NOT NULL,
    usuario_id integer NOT NULL
);
 (   DROP TABLE public.movimentacao_usuario;
       public         heap    postgres    false            �            1259    17249    usuario    TABLE       CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying(150) NOT NULL,
    senha character varying(150) NOT NULL,
    hierarquia character varying(45) NOT NULL,
    ativo boolean NOT NULL,
    email character varying(150) NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �            1259    17248    usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public          postgres    false    217            =           0    0    usuario_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;
          public          postgres    false    216            �           2604    17243 
   cliente id    DEFAULT     h   ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);
 9   ALTER TABLE public.cliente ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    17259    grupo id    DEFAULT     d   ALTER TABLE ONLY public.grupo ALTER COLUMN id SET DEFAULT nextval('public.grupo_id_seq'::regclass);
 7   ALTER TABLE public.grupo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    17266    item id    DEFAULT     b   ALTER TABLE ONLY public.item ALTER COLUMN id SET DEFAULT nextval('public.item_id_seq'::regclass);
 6   ALTER TABLE public.item ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    17295    movimentacao id    DEFAULT     r   ALTER TABLE ONLY public.movimentacao ALTER COLUMN id SET DEFAULT nextval('public.movimentacao_id_seq'::regclass);
 >   ALTER TABLE public.movimentacao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    17252 
   usuario id    DEFAULT     h   ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            (          0    17240    cliente 
   TABLE DATA           X   COPY public.cliente (id, nome, cpf, email, telefone, endereco, tipo, ativo) FROM stdin;
    public          postgres    false    215   �;       /          0    17275 	   estrutura 
   TABLE DATA           h   COPY public.estrutura (item_id, insumo_id, qtde_insumo, ativo, und_medida, valor_estrutura) FROM stdin;
    public          postgres    false    222   	>       ,          0    17256    grupo 
   TABLE DATA           ;   COPY public.grupo (id, descricao, tipo, ativo) FROM stdin;
    public          postgres    false    219   �>       .          0    17263    item 
   TABLE DATA           �   COPY public.item (id, id_grupo, descricao, qtde_estoque, ativo, unidade_medida, observacao, conv1, und_conv1, conv2, und_conv2, valor) FROM stdin;
    public          postgres    false    221   "?       1          0    17292    movimentacao 
   TABLE DATA           v   COPY public.movimentacao (id, tipo, data, item_id, cliente_id, valor, qtde, perda, observacao, id_pedido) FROM stdin;
    public          postgres    false    224   @       2          0    17310    movimentacao_usuario 
   TABLE DATA           K   COPY public.movimentacao_usuario (movimentacao_id, usuario_id) FROM stdin;
    public          postgres    false    225   )@       *          0    17249    usuario 
   TABLE DATA           L   COPY public.usuario (id, nome, senha, hierarquia, ativo, email) FROM stdin;
    public          postgres    false    217   F@       >           0    0    cliente_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.cliente_id_seq', 9, true);
          public          postgres    false    214            ?           0    0    grupo_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.grupo_id_seq', 5, true);
          public          postgres    false    218            @           0    0    item_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.item_id_seq', 17, true);
          public          postgres    false    220            A           0    0    movimentacao_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.movimentacao_id_seq', 1, false);
          public          postgres    false    223            B           0    0    usuario_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuario_id_seq', 19, true);
          public          postgres    false    216            �           2606    17247    cliente cliente_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    215            �           2606    17261    grupo grupo_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.grupo DROP CONSTRAINT grupo_pkey;
       public            postgres    false    219            �           2606    17268    item item_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.item DROP CONSTRAINT item_pkey;
       public            postgres    false    221            �           2606    17299    movimentacao movimentacao_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.movimentacao
    ADD CONSTRAINT movimentacao_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.movimentacao DROP CONSTRAINT movimentacao_pkey;
       public            postgres    false    224            �           2606    17314 .   movimentacao_usuario movimentacao_usuario_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.movimentacao_usuario
    ADD CONSTRAINT movimentacao_usuario_pkey PRIMARY KEY (movimentacao_id);
 X   ALTER TABLE ONLY public.movimentacao_usuario DROP CONSTRAINT movimentacao_usuario_pkey;
       public            postgres    false    225            �           2606    17254    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    217            �           2606    17305    movimentacao fk_cliente_id    FK CONSTRAINT     ~   ALTER TABLE ONLY public.movimentacao
    ADD CONSTRAINT fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES public.cliente(id);
 D   ALTER TABLE ONLY public.movimentacao DROP CONSTRAINT fk_cliente_id;
       public          postgres    false    3207    224    215            �           2606    17269    item fk_id_grupo    FK CONSTRAINT     p   ALTER TABLE ONLY public.item
    ADD CONSTRAINT fk_id_grupo FOREIGN KEY (id_grupo) REFERENCES public.grupo(id);
 :   ALTER TABLE ONLY public.item DROP CONSTRAINT fk_id_grupo;
       public          postgres    false    3211    219    221            �           2606    17286    estrutura fk_insumo_id    FK CONSTRAINT     v   ALTER TABLE ONLY public.estrutura
    ADD CONSTRAINT fk_insumo_id FOREIGN KEY (insumo_id) REFERENCES public.item(id);
 @   ALTER TABLE ONLY public.estrutura DROP CONSTRAINT fk_insumo_id;
       public          postgres    false    221    222    3213            �           2606    17281    estrutura fk_item_id    FK CONSTRAINT     r   ALTER TABLE ONLY public.estrutura
    ADD CONSTRAINT fk_item_id FOREIGN KEY (item_id) REFERENCES public.item(id);
 >   ALTER TABLE ONLY public.estrutura DROP CONSTRAINT fk_item_id;
       public          postgres    false    221    3213    222            �           2606    17300    movimentacao fk_item_id    FK CONSTRAINT     u   ALTER TABLE ONLY public.movimentacao
    ADD CONSTRAINT fk_item_id FOREIGN KEY (item_id) REFERENCES public.item(id);
 A   ALTER TABLE ONLY public.movimentacao DROP CONSTRAINT fk_item_id;
       public          postgres    false    224    221    3213            �           2606    17315 '   movimentacao_usuario fk_movimentacao_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movimentacao_usuario
    ADD CONSTRAINT fk_movimentacao_id FOREIGN KEY (movimentacao_id) REFERENCES public.movimentacao(id);
 Q   ALTER TABLE ONLY public.movimentacao_usuario DROP CONSTRAINT fk_movimentacao_id;
       public          postgres    false    3215    225    224            �           2606    17320 "   movimentacao_usuario fk_usuario_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movimentacao_usuario
    ADD CONSTRAINT fk_usuario_id FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);
 L   ALTER TABLE ONLY public.movimentacao_usuario DROP CONSTRAINT fk_usuario_id;
       public          postgres    false    217    225    3209            (     x�u��n�@����c*��.�?n�8���>X���8�#;�r���Gɋu����v%F0������`޼�j�}�����)U쏒R�SS5��.��g�4�L(�)�W�����1J����o�]w�M����0�0�ڢ�䅁}��>~��cq�vI�k�'��G[�4(&1Q������P|�&}�^��_PȢ��������Gr�2��@�`J0�wdt���oA�:CS�0n�Xti����!1��B�Bh���n�\��j�����\�ct�����X=4�������p�/\bR43�KnJ�91.�����TH,		��uu�n���m�{�wqЅ~����?�\gE>���I:�c��DǑ�:�����
�ހ�C[��vݮ�iQ�	���Mi���-�,=�+���W�H1��w3��a����R����d��:���
�u�7�N�,#?Y�UR=7��t��#�!�27e�CCQ,����*h������{O)g=D�?/{v�D��}ã��75�e      /   �   x�}�M
�@FיSx��dH����Am)h���MT���}I�cX��\�0�1 ���%�m�l���v�.�%߫��[�o���ʽ��o{B���7�>�w?$_�R�^0�vB�χi��r�U&R)kb��
qB�      ,   n   x�e�1�0F���)r)p 7��r��k�*!��p�^������E�����i�h���A٥�L�(��.�d1ޒ����4q��Z��'9����n.���ٯ+���      .   �   x�}�An� E��)�@h���H���tQu�+��x�8R�=Z/��κ+����Ұ���<a�}��w���W����	�GˡhP�Zw�u�re����'�E����wi��$����4h3#���7�//"蚽�������Z�zG"�-S�`���'��7�n��hp6!������ǐߵ��oB���L�mH�YN�e��Za%���?~dH      1      x������ � �      2      x������ � �      *   4   x�34�tt����	rt��LL��̃�q�@x�9Ez���zIE\1z\\\ ���     