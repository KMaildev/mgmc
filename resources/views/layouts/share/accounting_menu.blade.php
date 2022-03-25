<!-- Menu -->
<aside id="layout-menu" class="layout-menu-horizontal menu-horizontal  menu bg-menu-theme flex-grow-0">
    <div class="container-xxl d-flex h-100">
        <ul class="menu-inner">

            <li class="menu-item">
                <a href="javascript:void(0)" class="menu-link menu-toggle">
                    <div data-i2n="Layouts">Dashboard</div>
                </a>

                <ul class="menu-sub">
                    <li class="menu-item">
                        <a href="{{ route('accountingdashboard.index') }}" class="menu-link">
                            <div data-i2n="Without menu"> Dashboard</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="{{ route('accountingdashboard.index') }}" class="menu-link">
                            <div data-i2n="Without menu"> Customer Dashboard</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="{{ route('accountingdashboard.index') }}" class="menu-link">
                            <div data-i2n="Without menu"> Supplier Dashboard</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="{{ route('accountingdashboard.index') }}" class="menu-link">
                            <div data-i2n="Without menu"> Financial Dashboard</div>
                        </a>
                    </li>

                </ul>
            </li>

            <li class="menu-item">
                <a href="javascript:void(0)" class="menu-link menu-toggle">
                    <div data-i2n="Layouts">Customers</div>
                </a>

                <ul class="menu-sub">
                    <li class="menu-item">
                        <a href="{{ route('customer.index') }}" class="menu-link">
                            <div data-i2n="Without menu"> Customers</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <div data-i2n="Without menu"> Customer Sales Orders</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <div data-i2n="Without menu"> Customer Invoices</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <div data-i2n="Without menu"> Customer Returns</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <div data-i2n="Without menu"> Customer Receipts</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <div data-i2n="Without menu"> Allocate Payments</div>
                        </a>
                    </li>
                </ul>
            </li>


            <li class="menu-item">
                <a href="javascript:void(0)" class="menu-link menu-toggle">
                    <div data-i2n="Layouts">Suppliers</div>
                </a>

                <ul class="menu-sub">
                    <li class="menu-item">
                        <a href="{{ route('supplier.index') }}" class="menu-link">
                            <div data-i2n="Without menu"> Suppliers</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <div data-i2n="Without menu"> Supplier Purchase Orders</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <div data-i2n="Without menu"> Supplier Invoices</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <div data-i2n="Without menu"> Supplier Returns</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <div data-i2n="Without menu"> Supplier Payment</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <div data-i2n="Without menu"> Allocate Payments</div>
                        </a>
                    </li>

                </ul>
            </li>

            <li class="menu-item">
                <a href="javascript:void(0)" class="menu-link menu-toggle">
                    <div data-i2n="Layouts">Products</div>
                </a>

                <ul class="menu-sub">
                    <li class="menu-item">
                        <a href="{{ route('products.index') }}" class="menu-link">
                            <div data-i2n="Without menu"> Products</div>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="menu-item">
                <a href="{{ route('cashbook.index') }}" class="menu-link">
                    <div data-i1n="Layouts">
                        Cash Book
                    </div>
                </a>
            </li>

            <li class="menu-item">
                <a href="javascript:void(0)" class="menu-link menu-toggle">
                    <div data-i2n="Layouts">Reports</div>
                </a>

                <ul class="menu-sub">
                    <li class="menu-item">
                        <a href="#" class="menu-link">
                            <div data-i2n="Without menu"> Daily Report</div>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="menu-item">
                <a href="javascript:void(0)" class="menu-link menu-toggle">
                    <div data-i2n="Layouts">Accounting</div>
                </a>

                <ul class="menu-sub">
                    <li class="menu-item">
                        <a href="{{ route('bankform.index') }}" class="menu-link">
                            <div data-i2n="Without menu"> Bank Form</div>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="menu-item">
                <a href="javascript:void(0)" class="menu-link menu-toggle">
                    <div data-i2n="Layouts">Chart of accounts</div>
                </a>

                <ul class="menu-sub">
                    <li class="menu-item">
                        <a href="{{ route('accountclassification.index') }}" class="menu-link">
                            <div data-i2n="Without menu">Account Classification </div>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="{{ route('accounttype.index') }}" class="menu-link">
                            <div data-i2n="Without menu">Account Type </div>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="{{ route('chartofaccount.index') }}" class="menu-link">
                            <div data-i2n="Without menu">Chart of accounts </div>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="{{ route('subaccount.index') }}" class="menu-link">
                            <div data-i2n="Without menu">Sub Account </div>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</aside>
<!-- / Menu -->
