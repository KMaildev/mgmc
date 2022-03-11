<!-- Menu -->
<aside id="layout-menu" class="layout-menu-horizontal menu-horizontal  menu bg-menu-theme flex-grow-0">
    <div class="container-xxl d-flex h-100">
        <ul class="menu-inner">

            <li class="menu-item">
                <a href="{{ route('accountingdashboard.index') }}" class="menu-link">
                    <i class="menu-icon tf-icons bx bx-layout"></i>
                    <div data-i1n="Layouts">Dashboard</div>
                </a>
            </li>

            <li class="menu-item">
                <a href="javascript:void(0)" class="menu-link menu-toggle">
                    <i class="menu-icon tf-icons bx bx-layout"></i>
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
