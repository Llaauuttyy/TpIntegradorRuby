require "mechanize"
require "nokogiri"

DRINKS_PAGE_1 = "https://www.cotodigital3.com.ar/sitios/cdigi/browse/catalogo-bebidas-bebidas-sin-alcohol/_/N-j9f2pv"
DRINKS_PAGE_2 = "https://www.cotodigital3.com.ar/sitios/cdigi/browse/catalogo-bebidas-bebidas-con-alcohol/_/N-4hulsc"

PAGES_LIST = [DRINKS_PAGE_1] # [DRINKS_PAGE_1, DRINKS_PAGE_2]

class DrinksScraper 
    def scrapPages()

        mechanize = Mechanize.new

        PAGES_LIST.each { 
            |currentPagePath|

            currentPageHtml = mechanize.get(currentPagePath)

            # products = currentPageHtml.xpath("//ul[@id='products']/li")            
        }
    end

    def scrapProducts(products)
        products.each {
            |product|

            product_hash = {
                'rawTitle': scrapTitle(product),
                # 'rawPrice': scrapPrice(product),
                'rawIcon': scrapIcon(product)
            }

            puts product_hash

            # LLamo al parser

            # LLamo a la baseHandler
            
        }
    end
        
    def scrapTitle(product)
        rawTitle = product.xpath("//div[@class='descrip_full']").text
        return rawTitle
    end
        
    def scrapPrice(product)
        rawPrice = product.xpath("//span[@class='atg_store_newPrice']").text
        return rawPrice
    end
        
    def scrapIcon(product)
        rawIcon = product.xpath("//span[@class='atg_store_productImage']/img/@src").text
        return rawIcon
    end
end

DrinksScraper.new.scrapPages