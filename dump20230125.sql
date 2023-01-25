PGDMP             	             {            store    15.1    15.1 G    u           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            v           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            w           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            x           1262    18277    store    DATABASE     �   CREATE DATABASE store WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = icu LOCALE = 'en_US.UTF-8' ICU_LOCALE = 'en-US';
    DROP DATABASE store;
                gyftsie_app    false            d           1247    24586    payment    TYPE     X   CREATE TYPE public.payment AS ENUM (
    'PAYPAL',
    'STRIPE',
    'PAY ON PICKUP'
);
    DROP TYPE public.payment;
       public          gyftsie_app    false            �            1259    18789    cart    TABLE     K   CREATE TABLE public.cart (
    id integer NOT NULL,
    user_id integer
);
    DROP TABLE public.cart;
       public         heap    gyftsie_app    false            �            1259    18788    cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cart_id_seq;
       public          gyftsie_app    false    217            y           0    0    cart_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;
          public          gyftsie_app    false    216            �            1259    18796 	   cart_item    TABLE     �   CREATE TABLE public.cart_item (
    id integer NOT NULL,
    cart_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL
);
    DROP TABLE public.cart_item;
       public         heap    gyftsie_app    false            �            1259    18795    cart_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cart_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.cart_item_id_seq;
       public          gyftsie_app    false    219            z           0    0    cart_item_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.cart_item_id_seq OWNED BY public.cart_item.id;
          public          gyftsie_app    false    218            �            1259    24592 
   order_item    TABLE     �   CREATE TABLE public.order_item (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL
);
    DROP TABLE public.order_item;
       public         heap    gyftsie_app    false            �            1259    24591    order_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.order_item_id_seq;
       public          gyftsie_app    false    226            {           0    0    order_item_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.order_item_id_seq OWNED BY public.order_item.id;
          public          gyftsie_app    false    225            �            1259    24599    orders    TABLE       CREATE TABLE public.orders (
    order_id integer NOT NULL,
    user_id integer NOT NULL,
    status text NOT NULL,
    date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    amount real,
    total integer,
    ref text,
    payment_method public.payment
);
    DROP TABLE public.orders;
       public         heap    gyftsie_app    false    868            �            1259    24598    orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public          gyftsie_app    false    228            |           0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;
          public          gyftsie_app    false    227            �            1259    18820    products    TABLE     �   CREATE TABLE public.products (
    product_id integer NOT NULL,
    name text NOT NULL,
    price real NOT NULL,
    description text,
    image_url text,
    item_no integer
);
    DROP TABLE public.products;
       public         heap    gyftsie_app    false            �            1259    18819    products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_product_id_seq;
       public          gyftsie_app    false    221            }           0    0    products_product_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;
          public          gyftsie_app    false    220            �            1259    24661    resetTokens    TABLE     �   CREATE TABLE public."resetTokens" (
    id integer NOT NULL,
    email text NOT NULL,
    token text NOT NULL,
    used boolean DEFAULT false NOT NULL,
    expiration timestamp without time zone
);
 !   DROP TABLE public."resetTokens";
       public         heap    gyftsie_app    false            �            1259    24660    resetTokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public."resetTokens_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."resetTokens_id_seq";
       public          gyftsie_app    false    230            ~           0    0    resetTokens_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."resetTokens_id_seq" OWNED BY public."resetTokens".id;
          public          gyftsie_app    false    229            �            1259    18829    reviews    TABLE     �   CREATE TABLE public.reviews (
    product_id integer NOT NULL,
    user_id integer NOT NULL,
    content text NOT NULL,
    rating integer NOT NULL,
    date date DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id integer NOT NULL
);
    DROP TABLE public.reviews;
       public         heap    gyftsie_app    false            �            1259    18838    users    TABLE     q  CREATE TABLE public.users (
    user_id integer NOT NULL,
    password text,
    email text NOT NULL,
    fullname text NOT NULL,
    username text NOT NULL,
    google_id text,
    roles text DEFAULT '[customer]'::text NOT NULL,
    address text,
    city text,
    state text,
    country text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.users;
       public         heap    gyftsie_app    false            �            1259    18837    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          gyftsie_app    false    224                       0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          gyftsie_app    false    223            �           2604    18792    cart id    DEFAULT     b   ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);
 6   ALTER TABLE public.cart ALTER COLUMN id DROP DEFAULT;
       public          gyftsie_app    false    216    217    217            �           2604    18799    cart_item id    DEFAULT     l   ALTER TABLE ONLY public.cart_item ALTER COLUMN id SET DEFAULT nextval('public.cart_item_id_seq'::regclass);
 ;   ALTER TABLE public.cart_item ALTER COLUMN id DROP DEFAULT;
       public          gyftsie_app    false    219    218    219            �           2604    24595    order_item id    DEFAULT     n   ALTER TABLE ONLY public.order_item ALTER COLUMN id SET DEFAULT nextval('public.order_item_id_seq'::regclass);
 <   ALTER TABLE public.order_item ALTER COLUMN id DROP DEFAULT;
       public          gyftsie_app    false    225    226    226            �           2604    24602    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public          gyftsie_app    false    228    227    228            �           2604    18823    products product_id    DEFAULT     z   ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);
 B   ALTER TABLE public.products ALTER COLUMN product_id DROP DEFAULT;
       public          gyftsie_app    false    221    220    221            �           2604    24664    resetTokens id    DEFAULT     t   ALTER TABLE ONLY public."resetTokens" ALTER COLUMN id SET DEFAULT nextval('public."resetTokens_id_seq"'::regclass);
 ?   ALTER TABLE public."resetTokens" ALTER COLUMN id DROP DEFAULT;
       public          gyftsie_app    false    230    229    230            �           2604    18841    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          gyftsie_app    false    224    223    224            e          0    18789    cart 
   TABLE DATA           +   COPY public.cart (id, user_id) FROM stdin;
    public          gyftsie_app    false    217   T       g          0    18796 	   cart_item 
   TABLE DATA           F   COPY public.cart_item (id, cart_id, product_id, quantity) FROM stdin;
    public          gyftsie_app    false    219   8T       n          0    24592 
   order_item 
   TABLE DATA           H   COPY public.order_item (id, order_id, product_id, quantity) FROM stdin;
    public          gyftsie_app    false    226   ^T       p          0    24599    orders 
   TABLE DATA           e   COPY public.orders (order_id, user_id, status, date, amount, total, ref, payment_method) FROM stdin;
    public          gyftsie_app    false    228   �T       i          0    18820    products 
   TABLE DATA           \   COPY public.products (product_id, name, price, description, image_url, item_no) FROM stdin;
    public          gyftsie_app    false    221   W       r          0    24661    resetTokens 
   TABLE DATA           K   COPY public."resetTokens" (id, email, token, used, expiration) FROM stdin;
    public          gyftsie_app    false    230   �z       j          0    18829    reviews 
   TABLE DATA           Q   COPY public.reviews (product_id, user_id, content, rating, date, id) FROM stdin;
    public          gyftsie_app    false    222   �|       l          0    18838    users 
   TABLE DATA           �   COPY public.users (user_id, password, email, fullname, username, google_id, roles, address, city, state, country, created_at) FROM stdin;
    public          gyftsie_app    false    224   �|       �           0    0    cart_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.cart_id_seq', 2, true);
          public          gyftsie_app    false    216            �           0    0    cart_item_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.cart_item_id_seq', 61, true);
          public          gyftsie_app    false    218            �           0    0    order_item_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.order_item_id_seq', 27, true);
          public          gyftsie_app    false    225            �           0    0    orders_order_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_order_id_seq', 17, true);
          public          gyftsie_app    false    227            �           0    0    products_product_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.products_product_id_seq', 187, true);
          public          gyftsie_app    false    220            �           0    0    resetTokens_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."resetTokens_id_seq"', 7, true);
          public          gyftsie_app    false    229            �           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);
          public          gyftsie_app    false    223            �           2606    18801    cart_item cart_item_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.cart_item DROP CONSTRAINT cart_item_pkey;
       public            gyftsie_app    false    219            �           2606    18794    cart cart_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public            gyftsie_app    false    217            �           2606    24597    order_item order_item_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.order_item DROP CONSTRAINT order_item_pkey;
       public            gyftsie_app    false    226            �           2606    24607    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            gyftsie_app    false    228            �           2606    18827    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            gyftsie_app    false    221            �           2606    24669    resetTokens resetTokens_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."resetTokens"
    ADD CONSTRAINT "resetTokens_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."resetTokens" DROP CONSTRAINT "resetTokens_pkey";
       public            gyftsie_app    false    230            �           2606    18836    reviews reviews_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (user_id, product_id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            gyftsie_app    false    222    222            �           2606    18847    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            gyftsie_app    false    224            �           1259    18889    cart_prodcuct_idx    INDEX     ]   CREATE UNIQUE INDEX cart_prodcuct_idx ON public.cart_item USING btree (cart_id, product_id);
 %   DROP INDEX public.cart_prodcuct_idx;
       public            gyftsie_app    false    219    219            �           2606    18853     cart_item cart_item_cart_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cart(id);
 J   ALTER TABLE ONLY public.cart_item DROP CONSTRAINT cart_item_cart_id_fkey;
       public          gyftsie_app    false    3513    219    217            �           2606    24613 !   cart_item cart_item_cart_id_fkey1    FK CONSTRAINT        ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_cart_id_fkey1 FOREIGN KEY (cart_id) REFERENCES public.cart(id);
 K   ALTER TABLE ONLY public.cart_item DROP CONSTRAINT cart_item_cart_id_fkey1;
       public          gyftsie_app    false    219    3513    217            �           2606    18858 #   cart_item cart_item_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 M   ALTER TABLE ONLY public.cart_item DROP CONSTRAINT cart_item_product_id_fkey;
       public          gyftsie_app    false    221    3518    219            �           2606    24618 $   cart_item cart_item_product_id_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_product_id_fkey1 FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 N   ALTER TABLE ONLY public.cart_item DROP CONSTRAINT cart_item_product_id_fkey1;
       public          gyftsie_app    false    221    3518    219            �           2606    18848    cart cart_user_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 @   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_user_id_fkey;
       public          gyftsie_app    false    217    224    3522            �           2606    24608    cart cart_user_id_fkey1    FK CONSTRAINT     {   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_fkey1 FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 A   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_user_id_fkey1;
       public          gyftsie_app    false    217    3522    224            �           2606    24623 #   order_item order_item_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 M   ALTER TABLE ONLY public.order_item DROP CONSTRAINT order_item_order_id_fkey;
       public          gyftsie_app    false    228    3526    226            �           2606    24628 %   order_item order_item_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 O   ALTER TABLE ONLY public.order_item DROP CONSTRAINT order_item_product_id_fkey;
       public          gyftsie_app    false    3518    226    221            �           2606    24633    orders orders_user_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_id_fkey;
       public          gyftsie_app    false    228    224    3522            �           2606    18878    reviews reviews_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 I   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_product_id_fkey;
       public          gyftsie_app    false    3518    221    222            �           2606    24638     reviews reviews_product_id_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_product_id_fkey1 FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 J   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_product_id_fkey1;
       public          gyftsie_app    false    221    3518    222            �           2606    18883    reviews reviews_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 F   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_user_id_fkey;
       public          gyftsie_app    false    224    3522    222            �           2606    24643    reviews reviews_user_id_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey1 FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 G   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_user_id_fkey1;
       public          gyftsie_app    false    222    3522    224            e      x�3�4�2�4����� ��      g      x�36�4�4�4����� ��      n   �   x�%��C!��a�� �����͓�r�/	�p6�a���0l��Is��!��<Pqc��SF�8�L��dT��ޢ�����˰��ׇ�ɗ��V:.^��r��b/4�C#&k���������>�/��g�g�>$�qN$U      p     x�}��N�P���S�8�����F@PTh��*v��E�_Gr���۟����������� �����P���ЩY4S e��T!�vؼ6�+Zbd ���,ٰ�f��)Y'�����p��L�
�A1�=��5�sM�>�D��mH�݁S�a�J�j"j|8i�w3�K�����{(S�^��\�����"9����
����a�*���߅j29 Dy�|YB�]@H�q���E������UF�Cru
E�bjfU��<���L�(ϳ�W�.k�A��:i�1�O�h�ܟ9SNII
�3��,II���S�*��f���p�Z�W����W%]����{u����S���0���!\���R�%�Σ��yl>e��� s����r��ׅD�����ʩ�Q�V�N��/�,Cu�d�U�R\�)���A�^$]���p��bPWޤ||Jg�}�{�~&�%�k�S�ȵf}�����p�Oɗ����WT�}��*ap�ty���}�Z��2e      i      x��}�r�H��3�QZ�N�H�����x��ErI*5*���D�@���b�<��~�>�͗�q��R�,e�f�a��*�	���~���6��B��t���i�~�vOE����4��^���C���e�%]�g��T>9흺f?��ҩ�k���������j�(��y�ͣ�h�w�����1
�b+��Y��i�Ǧ���U������f�7.*���������&��v}�ע0/jV]�)|ʹ[�i�����i�t�)D+-�$�u��2ͨ�6`9����}m2�M�ݎ���u�%&���).�Sͬ��w(t�v�F�&�@��[1)h:[��q��j��(	�b/�����y�>䘈��.|�lL�Y�.E���".�2�G�î�X�e��}���&)b<H�,����,
q�f"LA]�j.��?7aۺ�<��)�H��`�V�R�����x87��NsliAo��B��հ�A"t����d�Y�&VNhXo�]�qe�u�Qr/��ij���:��Ux���+��l����W��1�c�$��q��"}v�����Keٺii�"��&�$F���t*�,���&F��2�!!VE(.PiM4�茘�_"��j{.��3*Iݴ�}si�i��kjT35�U��xR�U��YC��0h�.�4Ar
&�6�l\��Oa�����pu��.�<2�����_�[t�d�{$�i
q>`����)���-���i�Q�y|υХ_����᯿���x��6�d"�P��/��"�V9��c�0�H`��,«Y$�{��w�8�)V3��p5Oh�h�ѕ��^}ƗY�����f%
*w"��QV�u4����PNT�ns�M2ǧ�_��,�NBti�#�ϒ-�Z�_XI�4�.%
���jW�A��Cv�n�����1�o4����*r۳<���Dꦧ5��,\aCc�����)M+9Ӊfi�c�eX�B�0[G�8KRL�x�"uf�M���C��0�+Iꦯ��W'L����ܙ��V��D\��(��nF�֜��+�Q�a�\I�f�Mf�mB�DL�m�#��p�_���I�w�֦`�4� ԒA�� J�gsԱ,����1��X�bFL�-m"p�V�O`�9���߄x��"p1տ.�$��,�,�f��M�^ci��b��?G�"NP���O��&N�S�����4�G�UC��
�r{��7ث­{�{$
����%x�U��L���iCG�����~j�oy�����k��b?�k���y+�i���(�R���,WXL쬆/��$u��}��Ϙ�p:�rv���W����jz�?����aQ�$Aj�~����<��j�����W�e'Xԁ�����������~���"��YQ(U�"�3^}��q�Ņܶ���	�����2ݠ$��-@�4����4��ӻ=��'R�ʙSӗf�0��Q"u�D��g�t���zD3) �g@���t%	�C[ �WDKHB%�8a-Ϊt��*��uL��0.������ei�x�E��ԯ��]
ћ+�.����Ãh�+������ lSq��p�	fR� H0�t�1?�M�Õͷ����A^	���8v��kju����J��Q��H�r�^Ψ��B�L�8���C/E��!���%�ʏ�g�R7HRGMa���ItWY��D|��H{��-hrM�Wb3���|��ǭ����hMT��(���r3�[l��@AS��u5q����@��8�Zߊ�U��M�)|`8���b��"�a2 �&�/�V ���tO���E)��&���ܺ��N�z� $K����o�%�{( hz�'�v��uQH�V�A�_N��&��/I�W��o����Q�y��y�d|�c�K\u(!x��u�"v_�uNN�<�"���Jh���������7ܤ|u���^s���횱q8+��P '%J>��
0�NH�q��2Z��5E���-H30�ɢ֚_�0��"܁��g�gU�z�^l$3�X�o�1���,8H�"L6s�]:p��7kP�yA�YcE�f�ELk;'�f6�)fu�<py����1�/�0�"�r�r��@�,s�sB�Z�il9�ò+4< �MN��bN3��Z��4���0��xU�N�|N����+Lh�z6g�ÐE�ZF_g�j�����r�H[)»;�X��Q)��W1����o$^�� �YH��h�UF`ٕ�cR�|��)6˕heQ=�)^mq��0��F��*fk�5�ԭ@kE�E���!�8�o�UiݭZ�ԭ�K!$�� lt[�F	D\�[��H쳌��8ǴK���nܑCUAr4�N���������ݎ�N/��3�n�;�b��t���j_\�*��I��&�4���
�{��K��gȔ�/^�*��;V��dR�-�4��B����L�c3��,#�M�RBp�W���φ�����2'�yu�A	�B��<���W$�00pW���v�Ⱦ���+ڴ�Sy�A�̓����x��㙥k�H�v4�'Hƕ����y5�/șt�N,j�A`�@	ȵ�W9����b����d��v��M?���t]P#��ZV5"fe��6��c}�%���e�Ӊ��G����Z.��V�ae;uX)y]��Q;�ȣ�n�%�#m�5����Mb��N�/�`Fҳ�� �8���H�7o[��7R�]���-�v:K���q���� 8��NG���#;������W�iB���,���1o�0h�5�Z����ۇ",��8'�̜?�i�bv7з�MV�|Z��� ���)A��A��R�\�ʟD#�~�9)8�R��WSY̅�S�ŎN�Gb���4!!.<��H���ǈ�/"l���P��X�8�8�]�X�2C�J�f���:�٪�ic�M���s����ؘ��,a��c_��.MJ+���N:6���Gq|KV�~�:�UiЮiV�d"u��v=�u�/U��p|��Z�p0O�U���J�=�)=�L�Z���?xO��}�}�n��C`t������+߫��ݯ�����2�1K���08�Č��t�����|�K�@��)f�;�K�y8g/&����c��l ���ϭTm��WI7"u��.�Sqsџ��U�?���slZ�U�wJ-�`��ckrD�k�\4b���d^M�Q�Tzc�Z�2���	�0�1�j�4a��U�)�����o�0���۰{�+��n Cؿe*n�6|�*bDꎣuڽ{b@���O�(��Y�&��vg�F��U���\5i��W�t&u���.��c^��3�74w[j}QH̯�G�w�ԃ#�2K��::㩆����R�1�;޳p2��l�i$�kDp���ӛy^H�� H���A?�od`�8��*��G��T����K\���FX)��H�Vr^sM��\ *7I�d��@��!�����1��
���.&��#}�f��"���$Z�Ϻ�Ds�^|U�y��͸��Y�DE�9H¡�R&9��z��ӟ��?�00���I�x��lx-.SB�'�!��N��pO`9��c$�Ø���}(���=DE��!}�����v�R40�;�v=�,�'mQ� �\�ݕ��q��"u�  K	][�TLV�_����65��p�P�����Q��;A�A�ԝ��j�[����}q֜\��dڄ�p���Ǜv�4�������dr.��W���@�ͧ|��*5f{n�H�5����#n�,����gi6�D�)|�V��#������#6z0�?��8�A��3�����KV!ac���vֿOD������ꞟO�7+�=�"O���hO��J��2-������Ŏ_�	��@��Sb#R���NЯ����h�|2�̚�K�P5��<�ܝ���W"V���v���/j+�)ɂBU��P0�ī^|��`�-�/�Dꮧ���^[��Ӯf�PZϠ�{��]�Y�p
f{s&��K�m��~�����XA��L�n�"z^�$���^f��}P�G�`�iF��6�v$���ds���_E�Mj���/o��K1�n)J�2+I�3v.yȍ�g(8��Ba��qƹB��N��ݐ�    �[;����tԆmY�U����=sב	%Ob��d��0�h�u�a#�N�08�iV]/Q����R�,%��R5h����A�ؙ���ֆ�E
�tOxͬ� DΓ(\��Ϭ�t���)m���.�Lꞣ���S1�Ӊ8��x��x����Q)5���j���Pe%|vm��e2��Z�r,9�˨��W�T)��.5�$u���6b��FL��5J�G��H(�9�?���0���2Ǥ��Db�nät��0����`V����Ȭd5�:���+T�'H^��I�6�����s��3��]v�O�#}�U��G�A��6�Մ
xh�F�dR��gj�h	�:�V0L)g�ܱ����u��X!�e�s�L�~Ҡ�߬���`���>��o���/d��҄�k�eZ��d}�v����~>,����Q�)��}돢��q_���ɟƵ�a\[�m�O|���n�f1r>���\95��[�,�8�N���� �4�vN���h�GO�gg�v��,\�P�ũm���i�v��:����ᐼ���{��\R���e-'�������)��2u��'U�����S�_����֜5ߡ|�Q�7
��)� +��f@���Tx�F���}��xcA
�p�Ӯ����6�>�JF���B<��9��y�+�[�$Q8:H)CK,H]�0Z�G8XB"΁'�N�R��M��?���*�u"��/�3��,���O9�[-�XF�!R�����L� �	��o� ��F�� {��\��T�,��yh�*�x�
��	ܨ��yl9�N)fݻ��QHR��B ����t5o�rl���⣔ٯ�\��%�)T��˭�c%�����i2
��mf�����	E��/Є�8j��%���
�3sT*#�K�0,�Ǩ���	o�#�f1{���MW��3?oe$5Zb�ԏTđk��G�z`j���oRR]n3��2�U�b��l�����=���=���M4�L�����e�u���j�.pyi96�}5��~�.ΤX�(��/�� J�������ٹ�t� �
�u�����ؚ�
C>]����$�0�A=	���Ҭ+�v�1�]�H=p��8Ļ-�Q�Z�C�Jc�4���?��O�fC���Ӎ��v&�����O�$ ��jw��Ж���3p	ɻ͚���E�A۷Mb̷+�>�P�fQ�x�E+��[ٖ�/��g�utR��z�Gq���rX:h�%��O�����<"�L%T��k���C�D���g�[V�n��\1\��pv'T@U�B�ܦ4�/�ak�~�ѵ
%�R��ڮ]����	���~�$���v܆��4\�I�6�4Dg��kC��{��۴v����'���u�\w��o�'L�z�ힰhi�'���Zb�l�ݜ���dҝh6�)�V�B4��/���6N���|��%j	1BR�<;̪=���y���!���<����u��LfR�>W_���v�ف�� G.�N�'-(R���·�l�j��y��5פc�-����!��]������"RoxZ��7�K�7��x8h��~��t�,=�D�_�~HbR��� �t��?�TQC��c`Lꍷ��2�m�Q4���͖`o�z��}�u�W�qW�L��Z ��iy�_z�XB���2)��fzuSU������n���i�k�~|�o)R>�I	�:���S�le���E�DgL�=��L��}碐�P�)�:qN$�ai�
G�I��hb䠋M�*u�1{d`m�g�c�uWU�XFí��D��\�H"��H	�l�p���� ¨M$�t�ɍh5�C���}�������ٙ�����R���G<@��6�������C.:���H1���*�z�	c=�P�2����A�e���s��J�Ҡ�?�b���SJ&Ѩ�<p�����~�A��*|N��ND�T��X#T�Dw��Q�� ��E����iyNN��v~"�RU�kl��U63��[SE�L�'��vZ�1��u��02T���.��&�8���-�蚋��t���$oN'"W�#�&_�$��4���u�
�	��6U�$ؚ9������<hY=�KeX�K/	�h�9���0����7���0�
rs��枎�d�����	ǔ�`~%MB�b�tn(d#5%�"��g��{�۵2����j��A�.@$�gi��V�a�$8y/>E�:`ǔ��@@4Uc ј-Gw�h���&�}��J�	Pn,ءW"ј��{�i�+���dz՜�����~7�W����{%a�{;a�xc�χ%羐����/����#���+�'�k%J�%�~�c�+I�﷧���+9L��+�)H��?����4��-Ay�mk�2=w�$Z��_:�֠��6l��<����Xe0�qy��$������y�pT��犾g��qt�2Vi���x����b$����m4�D	&ў�MF�q���w���Ƣ՟L�bt�Y�{�r�My���mi,Tį�1%���d2��W�����\Q�ֲ��!�?$�S�"�-�"��kq�;���X<b:�?��:��GU#��vJ���{����`g���`����p��4�* R��k���X�ؖ!���z���_��bA��ա�x%���#Y!��%���
��Ap�[y6��΀�K��72k�8�s�nur��k��r9}��G�˴��g����o+��j!�}y����p�Ud�Dp���y������CؔG�e���#ߜm[v���$�ԓآ).#��"�n��o<�D�����L�[�TL�Y���m�
KN7��~(�4+�<�oa�ZG��i�e���r,0��Zo���k�:�뵸��,�j2[K�(�@x�[�<��EF|r"��v�9tz��|t�#����qJ#�|��Uu�����֪.;�f�F`ćO�":k���m�T��İ߮ˋ���_o���۶�W��$�����o�I����i�p ��b¢c�)�*�b��65��a�.�L�F����}FIyT����o~����߯X�It��I��a`ˎJxF���2���u����Q��a���R�0�����ъ��wDX�1y����3����$���4�RBiu� \:c7x�@�ŉ�@�r��@���i��I��a,��:��{@�P۞6Y�^�2�2&������DS�L�g6v�@�a�;a�����Z���Krk���P���w<#����NR����甕KA��ݸ%:I�39��i�/<�m�=B�ԣTFu��$ѵ�f�n|ҹ_9�_�������qp#��;Q>�KC�w�ޅ��#��7Ib�&M���͗/��R:Ϻ��4�;u�'y�F��*MG��%��I]���QmEHw��Eg���	"1Z�;��(y9��1��6c�f!כciZ�y���}�n�4[��s�2�uw�۱�Q��ס������^�s�Ew����[]���?��ͱ�߮��P׻�ؚ�� d�9D`CȺ�i�LW"њ�k���U�]����"tK�=��;���%����y����r�J�w���j�!�R��C��I����~:NE�%e/����G ��@;�*���k��#>d�~��,mxfe�0���Z{��NL�c��c��-^=H�A�@s��ˢ$	� �j��ߟU��-�a����T��g]nH=(���t�*��y��8�� bu�N���N]����kG�n���]����z�v�R%���-���TG�TsT��VW�2�Zڄ��oŔCF׉��v�%���(�����+-x�2�c�D�G��������w'�k_ފ�l�w)P�%���Á~�p�����Y�]���d�UIED�U��1ͫY��M{��ј�p_I9��_�Yz���6��Y��u�?���Y��K�����-f��ɀE��.�n�4���.�K-& v�qT
�CU�F�(�t��ج���1��Qa�p�o��?�0ڀ����H�R���S�:��p����5�G���w������mJ7C�v��.Κ�.7*���;�xqD)�$����u �  ?ubz���w����v"n�g��EC�~sڕ]y[Q�-W�Q�D�L��>(g��=��u�ٓo�SK�1�;"�4�0{�w�/������������l���eUv=�)�c�5������?4v��q����j$��^���6G�qɇ/�+5�ٻ�G�%����ʎ���`c�_��o���l�ۯ�:���Iw���w�n�7|ѝ�}j�f��&ߊyJ�7���r@�a��\����t�Y֠�*�Ded�aT###��:]=D��N����ӽ<ID�Y��4�TpB��H�)�v���ϖ���t�,],�n3������7E��$���`&.c�Zv忯tP�����]���������f��&��yA��n
�l-Z��]̱��n�ˍ*#�[E�Ӫ����L�ذa췐A[�78���Q�Hotu��b/���^��N��DLm:�6�;�E������"����+��T�%K�T�j�7�J��+j�>���|��wt�W��tw�'��v�������F��{���zsG�W���`7c/�G��X~Gc����S�)�M�b��ٛ�۳q��}~ˮT�h����.�Ɓ����F��y���)��	�(-I���鸭�uw�?����w����9����@�� ��f�/Z���ūx�
)�y���$z����o�T�
?�l����;��!D��M�f�L>R�"{
LM^�/��=��Z�}���B�jU��n��svUc�� )L?h�������S2�w�(� ����:�����/�BGH��0I��I�g�x��tlz��	��͗f��~6�sq�.)�HI)�A95�PE �@L�ֻ�����)���둸9��kX����'������[8x�w����R�3T-RAW��vȏ����jA��Z��B�`?��}l���+���cE��E��������n]�9      r   �  x�m�Ɏ�@ г��ܭ�f�4R�E���V.�Y���ă��X�EA�x�*vS=�i���v�Y����/_d���P���ot�h����+��vA��mF���[�1㥵]�=|IZ\��Fx�;���#(d�wl�?>6�Ⱦ��? �q�(n]��uä�틵-x�A_��!��g}��n��^�j_��A�֓��W�2��3.��d���K]dMgv��uEB�Nf� ���f~�q�JBkmΙ��7am(������&N�K0݉ag��{2�r�{�.�Es.e��xu�Sº�te=;*հ,�!��Oo�$�s��T�]����&n��Mnu%�����Vi~j[�g�Bä��m�����.8J\W��*�l�0�m�Ǳ��ҳ���E��$�dr��49�i���|���2J':I���t�FtY��W/E��������NQ�����      j      x������ � �      l     x����N�@F��S�`[:3�Y		��T�j]��)b�!e��^/qi�m���8i����;SZ�\Ď��cQE��0a�?�[/��0��M����8��\ƨ���Y-ʛ�C��e�Ѷ�O�ރ�@����g�G�z.ٷ�u/��;��1�dF�J۾��Gml)��1;�������fn��������Or��`���[~<�ɸ�`1�ucT���&W_D�9p5�O���O*Q���O�t]�!�NW�EKf�     