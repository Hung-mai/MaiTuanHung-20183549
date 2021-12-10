CREATE TABLE "Media" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "category" VARCHAR(45) NOT NULL,
  "price" INTEGER NOT NULL,
  "quantity" INTEGER NOT NULL,
  "title" VARCHAR(45) NOT NULL,
  "value" INTEGER NOT NULL,
  "imageUrl" VARCHAR(45) NOT NULL
);

CREATE TABLE "CD" (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "artist" VARCHAR(45) NOT NULL,
  "recordLabel" VARCHAR(45) NOT NULL,
  "musicType" VARCHAR(45) NOT NULL,
  "releasedDate" DATE
);

CREATE TABLE "Book" (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "author" VARCHAR(45) NOT NULL,
  "coverType" VARCHAR(45) NOT NULL,
  "publisher" VARCHAR(45) NOT NULL,
  "publishDate" DATETIME NOT NULL,
  "numOfPages" INTEGER NOT NULL,
  "language" VARCHAR(45) NOT NULL,
  "bookCategory" VARCHAR(45) NOT NULL
);

CREATE TABLE "DeleveryInfo" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(45),
  "province" VARCHAR(45),
  "instructions" VARCHAR(200),
  "address" VARCHAR(100)
);

CREATE TABLE "Card" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "cardCode" VARCHAR(15) NOT NULL,
  "owner" VARCHAR(45) NOT NULL,
  "cvvCode" VARCHAR(3) NOT NULL,
  "dateExpired" VARCHAR(4) NOT NULL
);

CREATE TABLE "DVD" (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "discType" VARCHAR(45) NOT NULL,
  "director" VARCHAR(45) NOT NULL,
  "runtime" INTEGER NOT NULL,
  "studio" VARCHAR(45) NOT NULL,
  "subtitle" VARCHAR(45) NOT NULL,
  "releasedDate" DATETIME
);

CREATE TABLE "Order" (
  "id" INTEGER NOT NULL,
  "shippingFees" VARCHAR(45),
  "deleveryInfoId" INTEGER NOT NULL,
  PRIMARY KEY ("id", "deleveryInfoId")
);

CREATE TABLE "OrderMedia" (
  "orderID" INTEGER NOT NULL,
  "price" INTEGER NOT NULL,
  "quantity" INTEGER NOT NULL,
  "mediaId" INTEGER NOT NULL,
  PRIMARY KEY ("orderID", "mediaId")
);

CREATE TABLE "Invoice" (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "totalAmount" INTEGER NOT NULL,
  "orderId" INTEGER NOT NULL
);

CREATE TABLE "PaymentTransaction" (
  "id" INTEGER NOT NULL,
  "createAt" DATETIME NOT NULL,
  "content" VARCHAR(45) NOT NULL,
  "method" VARCHAR(45),
  "cardId" INTEGER NOT NULL,
  "invoiceId" INTEGER NOT NULL,
  PRIMARY KEY ("id", "cardId", "invoiceId")
);

ALTER TABLE "CD" ADD FOREIGN KEY ("id") REFERENCES "Media" ("id");

ALTER TABLE "Book" ADD FOREIGN KEY ("id") REFERENCES "Media" ("id");

ALTER TABLE "DVD" ADD FOREIGN KEY ("id") REFERENCES "Media" ("id");

ALTER TABLE "Order" ADD FOREIGN KEY ("deleveryInfoId") REFERENCES "DeleveryInfo" ("id");

ALTER TABLE "OrderMedia" ADD FOREIGN KEY ("orderID") REFERENCES "Order" ("id");

ALTER TABLE "OrderMedia" ADD FOREIGN KEY ("mediaId") REFERENCES "Media" ("id");

ALTER TABLE "Invoice" ADD FOREIGN KEY ("orderId") REFERENCES "Order" ("id");

ALTER TABLE "PaymentTransaction" ADD FOREIGN KEY ("cardId") REFERENCES "Card" ("id");

ALTER TABLE "PaymentTransaction" ADD FOREIGN KEY ("invoiceId") REFERENCES "Invoice" ("id");

CREATE INDEX "aims.Order.fk_Order_DeleveryInfo1_idx" ON "Order" ("deleveryInfoId");

CREATE INDEX "aims.OrderMedia.fk_ordermedia_order_idx" ON "OrderMedia" ("orderID");

CREATE INDEX "aims.OrderMedia.fk_OrderMedia_Media1_idx" ON "OrderMedia" ("mediaId");

CREATE INDEX "aims.Invoice.fk_Invoice_Order1_idx" ON "Invoice" ("orderId");

CREATE INDEX "aims.PaymentTransaction.fk_PaymentTransaction_Card1_idx" ON "PaymentTransaction" ("cardId");

CREATE INDEX "aims.PaymentTransaction.fk_PaymentTransaction_Invoice1_idx" ON "PaymentTransaction" ("invoiceId");
