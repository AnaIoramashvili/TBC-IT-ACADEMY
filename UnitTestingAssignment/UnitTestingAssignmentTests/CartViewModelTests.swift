//
//  CartViewModelTests.swift
//  CartViewModelTests.
//
//  Created by Ana on 5/13/24.
//

import XCTest
@testable import UnitTestingAssignment

final class CartViewModelTests: XCTestCase {
    
    var viewModel: CartViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = CartViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    // MARK: - Test Selected Items Quantity

    func testSelectedItemsQuantity() {
        let product1 = Product(id: 1, title: "Product1", selectedQuantity: 2)
        let product2 = Product(id: 2, title: "Product2", selectedQuantity: 3)
        viewModel.selectedProducts = [product1, product2]
        
        let selectedItemsQuantity = viewModel.selectedItemsQuantity
        
        XCTAssertEqual(selectedItemsQuantity, 5)
    }
    
    func testTotalPrice() {
        let product1 = Product(id: 1, title: "Product1", price: 40.0, selectedQuantity: 2)
        let product2 = Product(id: 2, title: "Product2", price: 40.0, selectedQuantity: 3)
        viewModel.selectedProducts = [product1, product2]
        
        let totalPrice = viewModel.totalPrice
        
        XCTAssertEqual(totalPrice, 40.0 * 2 + 40.0 * 3)
    }
    
    // MARK: - Fetch Products Tests

    func testFetchProducts() {
        let expectation = XCTestExpectation(description: "Fetch Products")
        
        viewModel.fetchProducts()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {             XCTAssertNotNil(self.viewModel.allproducts)
            XCTAssertTrue(self.viewModel.allproducts!.count > 0)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 15.0)
    }

    // MARK: - Add Product With ID Test

    func testAddProductWithID() {
        let productToAdd = Product(id: 1, title: "Test Product", price: 20.0, selectedQuantity: 1)
        viewModel.allproducts = [productToAdd]
        let productIDToAdd = 1

        viewModel.addProduct(withID: productIDToAdd)

        XCTAssertEqual(viewModel.selectedProducts.count, 1)
        XCTAssertEqual(viewModel.selectedProducts.first, productToAdd)
    }
    
    // MARK: - Add Product With Product Test

    func testAddProductWithProduct() {
        let productToAdd = Product(id: 1, title: "Test Product", price: 20.0, selectedQuantity: 1)
        
        viewModel.addProduct(product: productToAdd)
        
        XCTAssertEqual(viewModel.selectedProducts.count, 1)
        XCTAssertEqual(viewModel.selectedProducts.first, productToAdd)
    }
    
    // MARK: - Add Random Product Test

    func testAddRandomProduct() {
         let products: [Product] = [
             Product(id: 1, title: "Product1", price: 10.0, selectedQuantity: 1),
             Product(id: 2, title: "Product2", price: 15.0, selectedQuantity: 2),
             Product(id: 3, title: "Product3", price: 20.0, selectedQuantity: 1),
             Product(id: 4, title: "Product4", price: 30.0, selectedQuantity: 1),
             Product(id: 5, title: "Product5", price: 20.0, selectedQuantity: 2)

         ]
         viewModel.allproducts = products
         
         viewModel.addRandomProduct()
         
         XCTAssertEqual(viewModel.selectedProducts.count, 1)
         XCTAssertTrue(products.contains(where: { $0 == viewModel.selectedProducts.first }))
     }
    
    // MARK: - Remove Product Test
     
     func testRemoveProduct() {
         let product1 = Product(id: 1, title: "Product1", price: 20.0, selectedQuantity: 1)
         let product2 = Product(id: 2, title: "Product2", price: 35.0, selectedQuantity: 2)
         viewModel.selectedProducts = [product1, product2]
         
         viewModel.removeProduct(withID: 1)
         
         XCTAssertEqual(viewModel.selectedProducts.count, 1)
         XCTAssertEqual(viewModel.selectedProducts.first, product2)
     }
    
    // MARK: - Clear Cart Test
     
     func testClearCart() {
         let product1 = Product(id: 1, title: "Product1", price: 50.0, selectedQuantity: 1)
         let product2 = Product(id: 2, title: "Product2", price: 65.0, selectedQuantity: 2)
         viewModel.selectedProducts = [product1, product2]
         
         viewModel.clearCart()
         
         XCTAssertTrue(viewModel.selectedProducts.isEmpty)
     }
}
