package LinkListDouble;
import java.util.Iterator;

import java.util.NoSuchElementException;
public class GenericStackLinkedLists <Item> implements Iterable<Item>{
	private Item[] a;
	private int N;
	private Node<Item> first;
	private static class Node<Item>{
		private Item item;
		private Node<Item> next;
	}
	public GenericStackLinkedLists() {
		
		first = null;
		N = 0;
	}
	
	
	public boolean isEmpty() {return first == null;}
	public int size() {return N;}
	public void push(Item item) {
		Node<Item> oldfirst = first;
		first = new Node<Item>();
		first.item = item;
		first.next = oldfirst;
		N++; 
	}
	public Item pop() {
		if(isEmpty())
			throw new NoSuchElementException("Stack underflow");
	Item item = first.item;
	first = first.next;
	N--;
	return item;
	
	}
	public Item peak() {
		if(isEmpty())
			throw new NoSuchElementException("Stack underflow");
		return first.item;
	}
	@Override
	public String toString() {
		StringBuilder s = new StringBuilder();
		for(Item item : this)
			s.append(item + " ");
		return s.toString();
	}
	@Override
	public Iterator<Item> iterator(){return new ListIterator<Item>(first);}
	private class ListIterator<Item> implements Iterator<Item>{
		private Node<Item> current;
		public ListIterator(Node<Item> first) {current = first;}
		@Override
		public boolean hasNext() {return current != null;}
		@Override
		public void remove() {
			throw new UnsupportedOperationException();
		}
		@Override
		public Item next() {
			if (!hasNext())
				throw new NoSuchElementException();
			Item item = (Item) current.item;
			current = current.next;
			return item;
		}
		
		}
	private class ReverseArrayIterator implements Iterator<Item>{
		private int i = N;
		@Override
		public boolean hasNext() {
			return i>0;
		}
		@Override
		public Item next() {return a[--i];}
		@Override
		public void remove() {}
	}
	
	}


