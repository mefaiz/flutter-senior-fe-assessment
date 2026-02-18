# Q4: AI-Generated Food Delivery App — Prompt Log

## Tool Used
**Cursor AI** (Model: Sonnet 4.5)

## 1. Initial "Master" Prompt

**Prompt:**
> Create a complete Flutter Food Delivery app with a clean, modern UI. Use a feature-first folder structure.
> 
> **Screens Required:**
> 1. **Restaurant List Screen:** Scrollable list of 5-6 restaurants showing name, image (use placeholder URLs from Picsum), rating (stars), and cuisine type.
> 2. **Food Menu Screen:** Tapping a restaurant navigates here. Show restaurant details at top. Display 8-10 menu items (name, image, price, description) with an "Add to Cart" button. Show a cart icon with an item count badge in the AppBar.
> 3. **Checkout Screen:** List all cart items with quantities. Allow quantity adjustment. Display subtotal, $5 delivery fee, and total. Include a "Place Order" button.
> 4. **Order Tracking Screen:** Show order confirmation and a visual timeline/progress indicator of the order status (e.g., "Preparing" -> "On the way" -> "Delivered"). Show estimated delivery time.
> 
> **Technical Requirements:**
> - Use mock/hardcoded data.
> - Implement proper state management for the cart.
> - Ensure smooth navigation.
> - Follow Flutter best practices (extract reusable widgets, separate data from UI).

---

## 2. Iterative Refinements

Below are the exact follow-up prompts I used in Cursor to refine the architecture, fix bugs, and polish the UI.

### Refinement 1: Architectural Organization
* **Prompt:** > "Let's clean up the architecture. Please refactor the code to extract all string literals, dimensions, and colors into a `lib/constants/` folder. Also, extract the mock data and CartProvider into a `lib/data/` folder, and move the OrderStatus logic into a Dart extension in `lib/extensions/`."
* **Result:** Cursor successfully separated concerns, resulting in `AppStrings`, `AppDimens`, and `AppColors` classes, and a clean `OrderStatusExtension` for mapping statuses to colors and icons.

### Refinement 2: State Management & UI Polish
* **Prompt:** > "The cart state isn't updating across all screens properly. Ensure `Provider` is initialized at the top of the widget tree. Also, update the 'Add to Cart' button to show a quick SnackBar confirmation, and ensure all network images have a subtle error builder and loading placeholder."
* **Result:** Real-time cart updates and badge counters were fixed. UI became more resilient to image loading delays.

### Refinement 3: Order Tracking Automation
* **Prompt:** > "On the Order Tracking screen, the status is currently static. Wrap the status logic in a `Timer.periodic` that automatically progresses the order status every 5 seconds from 'Preparing' to 'On the way' to 'Delivered', updating the visual timeline UI accordingly."
* **Result:** The app now simulates a live, animated order process without needing a backend connection.

### Refinement 4: Platform Targeting & Cleanup
* **Prompt:** > "I only need this to run on iOS and Android. Please remove the windows, macos, linux, and web folders from the project to keep the repository lightweight. Ensure the remaining codebase has no linting errors."
* **Result:** Stripped unnecessary platform folders and resolved minor `const` linting warnings to meet the "compile without errors" requirement.