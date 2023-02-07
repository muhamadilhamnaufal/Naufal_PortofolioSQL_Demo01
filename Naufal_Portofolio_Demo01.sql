/*1. Kita akan memberikan promosi untuk customer perempuan di kota Depok
melalui email. Tolong berikan data ada berapa customer yang harus kita berikan
promosi per masing-masing jenis email.*/

SELECT c.email , count(2) as count from `propane-avatar-329612.dataset.Dataset_DAMC` as d join `propane-avatar-329612.dataset.customer` as c on
d.customer_id=c.id
where d.customer_city = 'Depok' and d.customer_gender='Female'
group by  email
order by count;


/*
_________________________________________________________________________________________________________________________________

2.Berikan saya 10 id customer dengan total pembelian overall terbesar. Saya akan
memberikan diskon untuk campaign 9.9! */

select customer_id, sum(total) as total from `propane-avatar-329612.dataset.Dataset_DAMC`
group by customer_id
order by total desc limit 10;



/*
_________________________________________________________________________________________________________________________________

3. Bro! Ada berapa produk ya di database kita yang punya harga kurang dari
1000? Mau gue data nih buat flash sale. */

select distinct product_id, product_price from  `propane-avatar-329612.dataset.Dataset_DAMC`
where product_price < 1000
order by  product_id;


/*
_________________________________________________________________________________________________________________________________

4. Tolong list 5 product_id yang paling banyak dibeli dong, mau kita kasih diskon
nih di campaign 11.11. */

select distinct product_id, count(product_id) as total_transaksi from  `propane-avatar-329612.dataset.Dataset_DAMC` 
group by product_id
order by total_transaksi desc limit 5;


/*
_________________________________________________________________________________________________________________________________

5. Berapa jumlah transaksi, pendapatan dan jumlah produk yang terjual di
platform kita sekarang secara bulanan? apakah terjadi kenaikan atau tidak? */

select DATE_TRUNC(date(created_at),month) as date ,count (distinct transaction_id) as jumlah_transaksi, sum(total) as pendapatan, sum(quantity) as jumlah_produk
from `propane-avatar-329612.dataset.Dataset_DAMC`
group by 1
order by 1;


/*
_________________________________________________________________________________________________________________________________

6. Saya ingin melakukan pemerataan marketing di perusahaan kita. Boleh saya
minta info Total belanja dan rata-rata belanja dari customer kita per kota? */

select customer_city, sum(total) as total_belanja, round(avg(total)) as rata_rata_belanja
from `propane-avatar-329612.dataset.Dataset_DAMC`
group by 1;


/*
_________________________________________________________________________________________________________________________________

7. Ada berapa customer yang memiliki total belanja keseluruhan lebih dari >
200000 ? Tolong di breakdown by tipe storenya ya! */

select store, count(distinct customer_id) as jumlah_customer, sum(total) as total
from `propane-avatar-329612.dataset.Dataset_DAMC`
group by store
having total > 200000;






