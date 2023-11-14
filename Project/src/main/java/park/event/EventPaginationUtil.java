package park.event;

public class EventPaginationUtil {
	public static int paginationStart(int pageNumber, int pageSize) {
		return (pageNumber - 1) * pageSize + 1;
	}

	public static int paginationEnd(int pageNumber, int pageSize) {
		return pageNumber * pageSize;
	}

	
	public static int paginationTotalPages(int totalItems, int pageSize) {
		return (int) Math.ceil((double)totalItems/pageSize);

	}
	
	public static int paginationBlockPage(int pageBlock, int pageSize) {
		return (int)(Math.ceil((double)pageSize/pageBlock));
	}
}
